<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
if(request.getParameter("isMemRegSuccess") != null){
}
%>
<%@ include file="project_header.jsp" %>

<!DOCTYPE html>
<html>
<title>W3.CSS Template</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<script src="/js/index2.js"></script>
<style>

.menu {display: none}
.bgimg {
  background-repeat: no-repeat;
  background-size: cover;
  background-image: url("img/칼로리.jpg");
  min-height: 90%;
}
</style>
<body>

<%@ include file="projectheader.jsp" %>
<br><br>
<div>

</div>
<!-- Header with image -->
<header class="bgimg w3-display-container w3-grayscale-min" id="home">
  <div class="w3-display-bottomleft w3-padding">
    <span class="w3-tag w3-xlarge">SHB</span>
  </div>
  <div class="w3-display-middle w3-center">
    <span class="w3-text-white w3-hide-small" style="font-size:100px"><br></span>
    <span class="w3-text-white w3-hide-large w3-hide-medium" style="font-size:60px"><b><br>mobile</b></span>
    <p><a href="/quiz/quizlist" class="w3-button w3-xxlarge w3-black"> OX 퀴즈</a></p>
  </div>
</header>

 <!-- Menu Container -->


<%@ include file="projectfooter.jsp" %>


<script>
// Tabbed Menu
function openMenu(evt, menuName) {
  var i, x, tablinks;
  x = document.getElementsByClassName("menu");
  for (i = 0; i < x.length; i++) {
     x[i].style.display = "none";
  }
  tablinks = document.getElementsByClassName("tablink");
  for (i = 0; i < x.length; i++) {
     tablinks[i].className = tablinks[i].className.replace(" w3-red", "");
  }
  document.getElementById(menuName).style.display = "block";
  evt.currentTarget.firstElementChild.className += " w3-red";
}
document.getElementById("myLink").click();
</script>


<input type="hidden" name="regMsg" value="<%=request.getParameter("isMemRegSuccess") %>" id="resMsg">
<input type="hidden" id="loginRes" value="<%=request.getParameter("login") %>">
       <script>
         window.onload = function(){
                     
            
            if(document.getElementById("loginRes").value == "loginfail"){
               document.getElementById("login_modal").style.display ="block";
               document.getElementById("msg").innerHTML="일치하는 회원 정보가 없습니다.";
               document.forms["login"]["pw"].focus();
            }
         }
         </script>

<div id="modal">
	<div class="pop_layer" id="pop_layer">
	<div class="pop_header">
	<br><div class="pop_title" style="text-align:center; font-size:30px; ">로그인 화면</div><br><br><br>
	<div class="pop_close"><button style="background-color:#9ff09c" onclick= "document.getElementById('modal').style.display='none'">X</button></div>
	
	</div>
	<form name="login" method="post" action="/member/login" onsubmit="return formCheck()">
	<div class="pop_content">
	
	<div class = "item1">
		<input type="text" name="id" placeholder="아이디" size="30" maxlength="15"
		value="<% if(request.getParameter("id") != null) 
		out.print(request.getParameter("id")); %>" required><br>
		<input type="password" name="pw" placeholder="비밀번호" size="30" maxlength="15"><br>
		<p id="pw_msg"></p>
	</div>
	<div class="item2">
		<input class="pop_c" style="background-color:#9ff09c" type="submit" value="로그인">
	</div>
	<div>
		<a href ="/member/memReg">[회원가입] </a> <a>[ID/PW찾기] </a>
	</div>	
	</div>
	</form>  
	</div>
</div>

<script>
window.onload = function(){
   
   if(document.getElementById("resMsg").value ==1 ){
      alert("회원이 등록 되었습니다.");
      document.getElementById("login_modal").style.display = "block";   
   }
   
   if(document.getElementById("loginRes").value == "loginfail"){
      document.getElementById("login_modal").style.display ="block";
      document.getElementById("msg").innerHTML="아이디가 없습니다.";
      document.forms["login"]["pw"].focus();
   }
}

</script>
</body>
</html>
