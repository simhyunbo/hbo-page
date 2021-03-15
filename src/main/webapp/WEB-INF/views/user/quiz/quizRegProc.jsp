<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="org.apache.commons.fileupload.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>


<%
	
	
// 	String fileUploadPath = "d:\\SHB\\workspace\\myweb\\WebContent\\upload";

	ServletContext ctx = getServletContext();
	String fileUploadPath = ctx.getRealPath("/upload");
	
	
	
	DiskFileUpload upload = new DiskFileUpload();
				//new 하고 생성자이름하면 하나의 객체가 만들어진다 그 주소를 DiskFuleupload upload로 넘긴다
				
	List items = upload.parseRequest(request);
				//request form안에 input태그에 있는걸 참조한다
	
	Iterator params = items.iterator();
	
	String CHARSET = "utf-8";			
	
	
	String title = null;
	String content = null;
	//값 초기화
	String fileName = null;
	String saveFileName = null;
	long fileSize = 0;
	String contentType = null;
	String quizcorrect = request.getParameter("quizcorrect");
	
	//hasNext() : 읽어올 요소가 남아있는지 확인하는 메소드, 있으면 true, 없으면 false
	//next() : 다음 데이터를 반환
	//remove() : next로 읽어온 요소를 삭제		
	while(params.hasNext()){
	//가져올 데이터들이 있을때까지 확인하는 반복문
		FileItem item = (FileItem)params.next();
						//() 강제 타입변환 -> 타입을 일치 시켜준다
		if(item.isFormField()){
			System.out.printf("필드이름 : %s, 필드 값 : %s\n", item.getFieldName(), item.getString(CHARSET));
			//포멧을 지정하려면 printf 첫번째 %s자리에 fileItem.getFieldName()이 값이 들어가고

			if(item.getFieldName().equals("title")) { title = item.getString(CHARSET);}
			if(item.getFieldName().equals("content")) { content = item.getString(CHARSET);}
			if(item.getFieldName().equals("quizcorrect")) { quizcorrect = item.getString(CHARSET);}
		
			
			
		} else {
			//파일업로드
			fileSize = item.getSize();
			System.out.println("파일사이즈 : " + fileSize);
			
			if(fileSize > 0){
				
				fileName = item.getName();
				System.out.println("파일이름 : " + fileName);
				
				
		//중복된 파일을 업로드 하지 않기 위해 uid값 생성
				
				UUID uid = UUID.randomUUID();
				
				// UUID uid = UUID.randomUUID(); 거의 유일한 값을 뽑아준다
				
				int idx = fileName.lastIndexOf(".");
									//lastIndexOf 가장 마지막에 나타나는 문자열
				
				
				String S_fileName = fileName.substring(0,idx);
				String E_fileName = fileName.substring(idx+1);
				
				saveFileName = S_fileName + "_" + uid.toString() + "." + E_fileName;
				
				File file = new File(fileUploadPath + File.separator + saveFileName);
													//File.separator 부분자 속성값
	//				String saveFileName = 
						
				if(file.exists()){
				//위에 fileUploadPath + "\\" + fileName에 파일이 있는지 없는지 중복검사한다
					System.out.println("이미 업로드 된 파일 입니다");
				}
				
				item.write(file);
				
				contentType = item.getContentType();
				System.out.println("파일 콘텐츠 유형: " + contentType);
											
			

			}
	
		}	//ifFormFiled() if문
		
	
}//while 문

	request.setCharacterEncoding("UTF-8");
	
	//file문
	
	
	
	
	
		String id = (String)session.getAttribute("sess_id");				
		String sql = "INSERT INTO quizboard(title, content, id, correct)"
					+"VALUES (?,?,?,?)";
		
		
		PreparedStatement stmt = conn.prepareStatement(sql);
		
		
		stmt.setString(1,title);
		stmt.setString(2,content);
		stmt.setString(3,id);
		stmt.setString(4,quizcorrect);
		
		System.out.println(stmt);
		
		int rs = stmt.executeUpdate();
		
		
		if(rs > 0){
			sql = "SELECT seqno FROM quizboard WHERE id = ? order by wdate desc limit 1";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1,id);
			ResultSet rec = stmt.executeQuery();
			rec.next();
			int q_sno = rec.getInt("seqno");
				
			//file내용 db에 저장
			if(fileSize > 0){
				sql = "INSERT INTO fileUp(filename, savefilename, filesize, filetype, filepath, q_sno)";
				sql += " VALUES (?,?,?,?,?,?)";
				stmt = conn.prepareStatement(sql);
				stmt.setString(1, fileName);
				stmt.setString(2, saveFileName);
				stmt.setLong(3, fileSize);
				stmt.setString(4, contentType);
				stmt.setString(5, "/myproject/upload/");
				stmt.setInt(6, q_sno);
				stmt.executeUpdate();
			}
			response.sendRedirect("quizlist.jsp");
		}	
		
			
	//불가능하다 fileupload 들어올때 불가능하다
	// String title = request.getParameter("title");
	// String content = request.getParameter("content");
	
	
	

	
	
	
	
	stmt.close();
	conn.close();
	
	



%>
