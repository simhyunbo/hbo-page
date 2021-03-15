f_rs.<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*"%>
<%@ page import="java.text.*" %>
<%@ page import="java.lang.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.net.*" %>

<%@ include file="/mysql_conn.jsp"  %>
 
<%	
	
	request.setCharacterEncoding("UTF-8");
	String sno = request.getParameter("sno");

	//String savePath = "d:\\cosmos\\workspace\\myweb\\WebContent\\upload";
	ServletContext ctx = getServletContext();
	String fileUploadPath = ctx.getRealPath("/upload");
		
	String sql="SELECT * FROM fileup WHERE sno = ?";
	PreparedStatement stmt = conn.prepareStatement(sql);
	stmt.setString(1, sno);
	ResultSet rs = stmt.executeQuery(); 
	rs.next();	
		
	File file = new File(fileUploadPath + File.separator + rs.getString("savefilename"));
 	InputStream in = new FileInputStream(file);	
		
	//스트림 생성
	OutputStream os = response.getOutputStream();
	byte[] fileByte = new byte[(int)file.length()];	
		
	response.reset(); //이미 열려있는 출력스트림을 비우기 위해
	
	response.setContentType(rs.getString("filetype"));
	response.setContentLength(fileByte.length);
	response.setHeader("Content-Disposition", "attachment; filename=\"" + 
	                    URLEncoder.encode(rs.getString("filename"), "UTF-8") + "\";");
	response.setHeader("Content-Transfer-Encoding", "binary"); 		
	
	int leng = 0;	
	while((leng = in.read(fileByte)) > 0){
		os.write(fileByte, 0, leng);
	}
		
	in.close();	
	os.flush();
	os.close();	
	
	stmt.close();
	conn.close();
%>