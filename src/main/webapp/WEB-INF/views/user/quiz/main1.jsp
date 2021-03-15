<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../project_header.jsp" %>
<%@ include file="/mysql_conn.jsp" %>

<%
String id = (String)session.getAttribute("sess_id");

String sql = "SELECT * FROM member WHERE  id = ?";
PreparedStatement stmt = conn.prepareStatement(sql);
stmt.setString(1, id);

ResultSet rs = stmt.executeQuery();
rs.next();



ResultSet code = stmt.executeQuery();

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>O,X 퀴즈</title>
</head>
<body>

			
			<form name="memReg"  method="post" action="<%=ROOT%>/quiz/mainProc.jsp" onsubmit="return anwCheck()">
				
				
				 	<% if(isLogin){ %>	
					<span style= "color=#fff;">아이디 : <%= sess_name %></span>
					<% } else { %>
	
					<% } %>
				<fieldset style="width:80%; height:90%">
				<legend>1번</legend>
				
				<img src = "../img/나무젓가락.jpg" style = "width:80%; height:800px">
			
				<br><br>
				
				<input type="button"  name="quiz1" onclick="document.getElementById('butCheck').value=0" value="O">
				<input type="button"   name="quiz2" onclick="document.getElementById('butCheck').value=1" value="X">
				<input type="text"  name="butCheck" id="butCheck" value="">
			
				<br>
				</fieldset>
		
															
				<input id ="enroll" style="margin-left:500px;" type="submit" value="next">
				
				</form>
			

<script>
function quz1(a) {
	
	
	
	
	
	
}

// function quz2(){
// 	document.getElementById("butCheck").value = "1"
}

function anwCheck(){
	if(document.getElementById("butCheck").innerText == null){
		return false;}
		
		
}


</script>




</body>
</html>