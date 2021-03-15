<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<form name="file" method="post"  enctype="multipart/form-data" action="fileUploadProc.jsp">
		<input type="text" name="imgname" placeholder="이름">
		<input type="password" name="pw" placeholder="비밀번호">
		<input type="file" name="filename1">
		<input type="file" name="filename2">
		<input type="submit" value="전송">	
	</form>

</body>
</html>