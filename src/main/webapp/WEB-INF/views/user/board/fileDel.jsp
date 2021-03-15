<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*" %>

<%@ include file="../mysql_conn.jsp" %>
<!-- db내용지운다 -->
<% 

String sno = request.getParameter("sno");

String sql = "SELECT * FROM fileup WHERE sno = ?";
PreparedStatement stmt = conn.prepareStatement(sql);
stmt.setString(1, sno);
ResultSet rs = stmt.executeQuery();

rs.next();



// String fileUploadPath = "d:\\SHB\\workspace\\myweb\\WebContent\\upload";

ServletContext ctx = getServletContext();
String fileUploadPath = ctx.getRealPath("/upload");

File file = new File(fileUploadPath + File.separator + rs.getString("savefilename"));

//파일삭제 위에 경로에있는 파일 삭제

if(file.exists()){
	//파일삭제
	if(file.delete()){
		
		sql = "DELETE FROM fileup WHERE sno = ?";
		stmt = conn.prepareStatement(sql);
		stmt.setString(1, sno);
		stmt.executeUpdate();
		out.print("1");
		
	} else {
		out.print("0");
	}
}

stmt.close();
conn.close();

		

%>
