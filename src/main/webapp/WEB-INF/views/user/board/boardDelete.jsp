<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.io.*" %>
<%@ include file="/mysql_conn.jsp" %>

<%
request.setCharacterEncoding("UTF-8");


String seqno = request.getParameter("seqno");

String sql = "SELECT * FROM fileup WHERE b_sno = ?";
PreparedStatement stmt = conn.prepareStatement(sql);
stmt.setString(1,seqno);
ResultSet rs = stmt.executeQuery();

System.out.println(stmt);
while(rs.next()){
	ServletContext ctx = getServletContext();
	String fileUploadPath = ctx.getRealPath("/upload");

	File file = new File(fileUploadPath + File.separator + rs.getString("savefilename"));

	//파일삭제 위에 경로에있는 파일 삭제

	if(file.exists()){
		//파일삭제
		if(file.delete()){
			
			sql = "DELETE FROM fileup WHERE b_sno = ?";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, seqno);
			stmt.executeUpdate();
			out.print("1");
			
		} else {
			out.print("0");
		}
	}
	
}

sql ="DELETE FROM board WHERE seqno = ?";
	

stmt = conn.prepareStatement(sql);
stmt.setString(1,seqno);


System.out.println(stmt);

int rec = stmt.executeUpdate();

if(rec > 0){
	response.sendRedirect("boardList.jsp");
}




stmt.close();
conn.close();





%>
