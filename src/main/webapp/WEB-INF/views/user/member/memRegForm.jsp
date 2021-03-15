<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../project_header.jsp" %>
<!DOCTYPE html>
<html>
<title>W3.CSS Template</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="/js/Newmemform.js"></script>
<script src="/js/index2.js"></script>
<script src="/js/formcheck.js"></script>
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
	
			<h2>회원가입</h2>
			
		<div class="main">
		<div class="card" style="width:80%">
			
			<div style = "margin-top:50px;">
			<form name="memReg"  method="post" action="/member/insert" onsubmit="return memberFormCheck()">
				
				<input type="text" name="id" maxlength="15" placeholder="아이디" onchange="idCheck()">
				
				<p id="idCheckMsg" style="color:red"></p>
				<input type="hidden" name="isIdCheck" id="isIdCheck">
				<br>
				
				<input type="password" name="pw" maxlength="15" placeholder="패스워드"><br>
				<p id="pw1">* 최소 5자리 ~ 15자리</p>
	<!-- 			required -반드시 입력되야한다. -->
				<input type="text" name="name" placeholder="이름"><br>
				
				<fieldset>
				<legend>성별</legend>
				<input type="radio" name="gender" value="M">남자
				<input type="radio" name="gender" value="W">여자
				</fieldset>
				<p id="gender_error"></p>
				<br>
				
				
				<label>이메일</label>
				<input type="text" name="eid" placeholder="이메일id" onchange="inputId()">@
				<input type="text" name="domain" placeholder="도메인">
				<select name="sel_domain" style="background-color:#f1f1f1"
				onchange="inputDomain()">
					<option value="">직접입력</option> 
					<option value="naver.com">naver.com</option> 
					<option value="daum.net">daum.net</option> 
					<option value="gmail.com">gmail.com</option>	 
				</select>
				<p id="domain1"></p>
				<fieldset>
				<legend>취미</legend>
					<input type="checkbox" name="hobby" value="music">music
					<input type="checkbox" name="hobby" value="study">study
					<input type="checkbox" name="hobby" value="health">health
				</fieldset>
					<p id="hobby_e"></p>
				
				<script src="/js/search_address.js"></script>
				<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
				<input type="text" name="postcode" size="20" id="postcode" readonly>
				<input type="button" onclick="search_address()" value="우편번호 찾기"><br>
				<input type="text" name="addr1" placeholder="주소" id="address" readonly><br>
				<input type="text" name="addr2" placeholder="상세주소입력" id="d_address">
				<input type="text" name="addr3" placeholder="참고항목" id="e_address" readonly>
				<br>
				<textarea name="intro" rows="6" cols="10" placeholder="자기소개 100글자이내"></textarea><br>
				<input id ="enroll" type="submit" value="등록">
				<input type="reset" value="초기화">
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
