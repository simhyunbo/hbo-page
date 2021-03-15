<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
if(request.getParameter("isMemRegSuccess") != null){
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="admin_login.css">

<script src="a.js"></script>
<title>Insert title here</title>
</head>
<body>

<input type="hidden" name="regMsg" value="<%=request.getParameter("isMemRegSuccess") %>" id="resMsg">
<input type="hidden" id="loginRes" value="<%=request.getParameter("login") %>">

<script>
window.onload = function(){
	if(document.getElementById("resMsg").value == 1){
	document.getElementById("modal").style.display = "block";
	}
	
	var login_msg;
	switch(document.getElementById("loginRes").value){
		case "0":
			login_msg = "아이디가 없습니다.";
			break;
		case "1":
			login_msg = "비밀번호 불일치";
			break;
	
	}
	
	if(	document.getElementById("loginRes").value <3) {
		document.getElementById("modal").style.display = "block";
		document.getElementById("pw_msg").innerHTML = login_msg;
		document.forms["login"]["pw"].focus();
	}
}

</script>

<div id="modal">
	<div class="pop_layer" id="pop_layer">
	<div class="pop_header">
	<br><div class="pop_title" style="text-align:center; font-size:30px; ">관리 시스템</div><br><br><br>
	
	</div>
	<form name="login" method="post" action="login">
	<div class="pop_content">
	
	<div class = "item1">
		<input type="text" name="id" placeholder="아이디" size="30" maxlength="15" required><br>
		<input type="password" name="pw" placeholder="비밀번호" size="30" maxlength="15" required><br><br>
		<p id="pw_msg"></p>
	<span id="login_msg"></span>
	</div>
	<div class="item2">
		<input class="pop_c" type="submit"  value="로그인">
	</div>
	</div>
	</form>  
	</div>
</div>
</body>
</html>