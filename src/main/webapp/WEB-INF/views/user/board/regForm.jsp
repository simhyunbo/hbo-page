<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../project_header.jsp" %>
<!DOCTYPE html>
<html>
<title>W3.CSS Template</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="<%=ROOT%>/js/Newmemform.js"></script>
<script src="<%=ROOT%>/js/index2.js"></script>
<style>
body, html {height: 100%}
body,h1,h2,h3,h4,h5,h6 {font-family: "Amatic SC", sans-serif}
.menu {display: none}
.bgimg {
  background-repeat: no-repeat;
  background-size: cover;
  background-image: url("../img/칼로리.jpg");
  min-height: 90%;
}
.content{
	margin-right:auto;

}

.bg{
	border-box:1px solid #000000;
	background-color:#ffffff;

	
}


</style>
<body>

<%@ include file="../projectheader.jsp" %>

<!-- Header with image -->
<header class="bgimg w3-display-container w3-grayscale-min" id="home">
  <div class="w3-display-bottomleft w3-padding">
    <span class="w3-tag w3-xlarge">SHB</span>
  </div>
  <div class="w3-display-middle">
  	<div class="bg">
  	
  	
	   <div class="content" style="width:100%">
	
			<h2>게시판 등록</h2>

			
		<div class="main">
		<div class="card" style="width:80%">
			
			<div style = "margin-top:50px;">
			<form name="board"  method="post" enctype="multipart/form-data" action="/board/register">
				<input type="text" name="title" placeholder="제목" maxlength="255" style="width:500px" required>
				<textarea name="content" placeholder="내용"></textarea>	
				<input type="file" name="files">			
				<input type="submit" value="등록">
			</form>
			</div>
		</div>
		</div>
		</div>
	</div>
 </div>
</header>




<%@ include file="../projectfooter.jsp" %>




</body>
</html>
