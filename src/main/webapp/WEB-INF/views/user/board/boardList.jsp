<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import = "java.text.SimpleDateFormat" %>
<%@ page import = "java.util.Date" %>
<!-- jsp에서 외부 api 페이지를 사용하려면 import를 해줘야 쓸 수 있다 -->





<%@ include file="../project_header.jsp" %>
<!DOCTYPE html>
<html>
<title>W3.CSS Template</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta charset="UTF-8">
<script src="<%=ROOT%>/js/Newmemform.js"></script>
<script src="<%=ROOT%>/js/index2.js"></script>
<style>
body, html {height: 100%}
body,h1,h2,h3,h4,h5,h6 {font-family: "Amatic SC", sans-serif}
.menu {display: none}

.content{
	margin-right:auto;
	position:relative;
	margin-top: 70px;

}

button {
	background-color : #008cba;
	border:none;
	color:white;
	padding:16px 32px;
	text-align: center;
	text-decoration:none;
	font-size:16px;
	margin:4px 2px;
	cursor: pointer;
}

button.blue{
	background-color :white; 
	color:black;
	border:2px solidd #008cba;
}

button.blue:hover{
	background-color:#008cba;
	color:white;
}


</style>
<body>

<%@ include file="../projectheader.jsp" %>

<!-- Header with image -->


  

  	
	<div class="content" style="width:100%">
	
		<h2>게시판</h2>

			
				<div>
				<c:if test="${sess_name != null }">
				<button class="button" onclick="location.href='/board/regForm'">등록</button>
				</c:if>
					<table>
						<thead>
							<tr>
								<th>순번</th>
								<th>제목</th>
								<th>조회수</th>
								<th>작성일자</th>
								<th>작성자</th>
							</tr>
						</thead>
						<tbody>

							
					
							<c:forEach items="${board }" var="dto">
							<tr onclick ="location.href='view?bno=${dto.board_no}'">
								<td>${dto.rownum}</td>							
								<td style="text-align:center">${dto.title}</td>
								<td>${dto.cnt}</td>
								<td>${dto.wdate}</td>
								<td>${dto.member_id}</td>
								
							</tr>
							</c:forEach>
						
						</tbody>
					
					
					
					
					</table>
				
				
				
				
				</div>
			</div>
<div id="modal">
	<div class="pop_layer" id="pop_layer">
	<div class="pop_header">
	<br><div class="pop_title" style="text-align:center; font-size:30px; ">로그인 화면</div><br><br><br>
	<div class="pop_close"><button onclick= "document.getElementById('modal').style.display='none'">x</button></div>
	
	</div>
	<form name="login" method="post" action="/member/login.me" onsubmit="return formCheck()">
	<div class="pop_content">
	
	<div class = "item1">
		<input type="text" name="id" placeholder="아이디" size="30" maxlength="15"
		value="<% if(request.getParameter("id") != null) 
		out.print(request.getParameter("id")); %>" required><br>
		<input type="password" name="pw" placeholder="비밀번호" size="30" maxlength="15"><br>
		<p id="pw_msg"></p>
	</div>
	<div class="item2">
		<input class="pop_c" type="submit" value="로그인">
	</div>
	<div>
		<a href ="/member/memReg.me">[회원가입] </a> <a>[ID/PW찾기] </a>
	</div>	
	</div>
	</form>  
	</div>
</div>		





<%-- <%@ include file="../projectfooter.jsp" %> --%>




</body>
</html>
