<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../project_header.jsp" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%-- <% --%>

// String seqno = request.getParameter("seqno");
// String sql = "SELECT * FROM board WHERE  seqno = ?";
// PreparedStatement stmt = conn.prepareStatement(sql);
// stmt.setString(1,seqno);
// System.out.println(stmt);
// ResultSet rs = stmt.executeQuery();
// rs.next();

// sql = "SELECT * FROM fileUp WHERE b_sno = ?";
// stmt = conn.prepareStatement(sql);
// stmt.setString(1, seqno);
// ResultSet rec = stmt.executeQuery();

<%-- %> --%>
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
	margin-top: 70px;
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
	
			<h2>게시판 수정</h2>
			
		<div class="main">
		<div class="card" style="width:80%">
			
			<div style = "margin-top:50px; display:flex;" >
			<c:set value="${board}" var="dto" />
			<form name="board" method="post" enctype="multipart/form-data" action="modify">		
				<input type="hidden" name="bno" value="${dto.bno}">		
				<input type="hidden" name="count" value="${dto.count}">
				<input type="hidden" name="wdate" value="${dto.wdate}">
				<input type="hidden" name="writer" value="${dto.id}">
				
					  
				<input type="text" name="title" placeholder="제목" maxlength= "255" style="width:500px" required
				  value="${dto.title}">	
		 		<textarea name="content" placeholder="내용" >${dto.content}</textarea>
				
				
			<c:choose>
		 		<c:when test="${!empty uploadFile.fileName}">
				 	<c:set value="${uploadFile.fileType}" var="ftype" />
					<c:set value="${fn:substring(ftype, 0,fn:indexOf(ftype,'/') ) }" var="type"/>
						
					<div id="file">		
					<c:if test="${ type eq 'image'}">							 						 			
						<img width="100px" height="100px" src="/upload/${uploadFile.saveFileName }" />
					</c:if>	
					${uploadFile.fileName } (사이즈: ${uploadFile.fileSize }) 	
			 		<input type="button" value="삭제" onclick="fileDelete('${board.bno}','${uploadFile.saveFileName }')">					 				 				 	
					</div>	
		 		</c:when>
		 		<c:when test="${empty uploadFile.fileName}">
		 			<input type="file" name="files"><br>
		 		</c:when>
		 	</c:choose>
				<input type="submit" value="수정">
			</form>				
			</div>
					
				
		
			</div>
		</div>
		</div>
		</div>
	</div>
 
</header>
<div id="modal">
	<div class="pop_layer" id="pop_layer">
	<div class="pop_header">
	<br><div class="pop_title" style="text-align:center; font-size:30px; ">로그인 화면</div><br><br><br>
	<div class="pop_close"><button onclick= "document.getElementById('modal').style.display='none'">x</button></div>
	
	</div>
	<form name="login" method="post" action="<%=ROOT %>/member/loginProc.jsp" onsubmit="return formCheck()">
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
		<a href ="<%=ROOT %>/member/memRegForm.jsp">[회원가입] </a> <a>[ID/PW찾기] </a>
	</div>	
	</div>
	</form>  
	</div>
</div>



<%@ include file="../projectfooter.jsp" %>
<script>
function fileDelete(bno,savefilename){
	
	var x = new XMLHttpRequest();
	
	x.onreadystatechange = function(){
		//상태값 확인
		if(x.readyState === 4) {
			//서버로 부터 응답을 받은 경우			
			if(x.status ===200){
				//성공
				var tag = document.getElementById("file");
				
				if(x.responseText.trim() === "0"){
					//responseText는 서버쪽에서 out.print로 던진값을 받는다 
					alert("파일 삭제 실패 하였습니다.");
					
				} else {
					alert("파일 삭제 하였습니다");
					tag.innerHTML = "<input type ='file' name='files'>";
					
				}
			} else {
				console.log('에러코드 :' + x.status);
				//에러코드 콘솔로 찍어보기
			}
		}
	};
	
	x.open("POST", "/deleteFile", true);
		//	어떤방식인지	,어떤문서 요청  ,비동기 방식으로 요청
	x.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	x.send("bno=" + bno + "&saveFilename=" + savefilename);
		//서버안에 변수와 값을 던져준다
		//여기서 fileDel에서 0이나 1값을 가지고오면 위에 함수에서 받는다
}

</script>



</body>
</html>
