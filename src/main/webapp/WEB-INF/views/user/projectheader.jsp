 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core" %>

    <!-- Navbar (sit on top) -->
	<div class="w3-top">
    <div class="w3-bar w3-xlarge w3-black w3-opacity w3-hover-opacity-off" id="myNavbar">
    <a href="/" class="w3-bar-item w3-button">HOME</a>
<!--     <a href="#menu" class="w3-bar-item w3-button">MENU</a> -->
    <a href="#about" class="w3-bar-item w3-button">ABOUT</a>
    <a href="#myMap" class="w3-bar-item w3-button">CONTACT</a>
     <a href="/board/boardList" class="w3-bar-item w3-button">BOARD</a>
     <a href="/admi/admilogin" class="w3-bar-item w3-button">관리자로그인</a>
    
    

	
	<c:set value="${sess_name}" var="sessName"/>
	<c:if test="${sessName != NULL }">	
	<span style= "color=#fff;">${sessName}님 반갑습니다.</span>
	<span id="logout">

		<a href="/member/myPage" class="w3-bar-item w3-button">MyPage</a>
		<a href="/member/logout" class="w3-bar-item w3-button">Logout</a>

		
	</span>
	</c:if>
		<c:if test="${sessName == NULL }">
	
	<span id="login" onclick="document.getElementById('modal').style.display = 'block'">
		<a href="#" style="background-color:#4caf50;">Login</a>
	</span>
	</c:if>
	
	

  </div>
</div>
  


	


