<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page import="org.apache.commons.fileupload.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  

<%@ include file="/project_header.jsp" %>
   


<%-- <% --%>



<!DOCTYPE html>
<html>
<title>W3.CSS Template</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta charset="UTF-8">
<script>
function Delcheck(){
	if(confirm("정말로 삭제 하시겠습니까?")){
		return true;
	}else{
		return false;
	}	
}


</script>


<title>OX퀴즈</title>

<style>

.menu {display: none}

.content{
	margin-right:auto;
	position:relative;
	margin-top: 70px;

}



</style>
<body>

<%@ include file="../projectheader.jsp" %>

<!-- Header with image -->

<div class="content" style="width:100%">

		<h2>OX퀴즈</h2>
		
	
	
		
	<div style = "margin-top:50px;">
			
			<table>
				<c:set value="${quiz}" var="dto"/>
				<thead>
					<tr>
						<td style="text-align:left">${dto.title}</td>
						<td style="text-align:right">조회수 : ${dto.count}</td>
					</tr>
					<tr>
						<td style="text-align:left">작성자 : ${dto.id}</td>
						<td style="text-align:right">${dto.wdate}</td>
					</tr>
					<tr style="height:300px; verticaln-align:top; background-color:#f5f5f5">
						<td colspan="2" style="text-align:left; padding-top:20px;">
						${dto.content}
									
										
			

						</td>
					</tr>
					<c:if test="${dto.upfile.fileName != null }">
					<tr>
					<c:set value="${ dto.upfile.fileType}" var="ftype" />
					<c:set value="${fn:substring(ftype, 0,fn:indexOf(ftype,'/') ) }" var="type"/>
					
						<td colspan="2" style="text-align:left"> 첨부파일 : 	
						
							<form name="filedown" method="post" action="fileDown.do">		
								<input type="hidden" name="filename" value="smile.jpg">
								<input type="hidden" name="savefilename" value="smile_e24c01bd-4cf4-4d6f-88f2-2e74aef22d65.jpg">
								<input type="hidden" name="filesize" value="25319">
								<input type="hidden" name="filepath" value="/upload/">	
								<input type="hidden" name="filetype" value="image/jpeg">
								
								<c:if test="${ type eq 'image'}">
									<img width="100px" height="100px" src="/upload/${dto.upfile.saveFileName }" />
								</c:if>
								${dto.upfile.fileName } (사이즈: ${dto.upfile.fileSize }) 	
								
								<input type="submit" value="다운로드" >								
							</form>
							
							
						</td>
					</tr>
					</c:if>				
							
				</thead>						
			</table>
			
				<c:if test="${dto.id == sess_id}">
			<form name ="boardModifyBtn"  action="quizModifyForm.qo">
				<input type="hidden" name="seqno" value="${dto.seqno}">
				<input type="submit" value="수정">
			</form>		
			<form name ="boardDelBtn"  action="quizDelete.qo" onsubmit="return Delcheck()">
				<input type="hidden" name="seqno" value="${dto.seqno}">
				<input type="submit" value="삭제">
			</form>
			</c:if>
			<div id="detail" style="display:hidden">
			문제 상세 설명입니다.			
			</div>
			<form name="memReg">

				<input type="button"  name="quiz1" onclick="document.getElementById('quiz_choice').value=0" value="O">
				<input type="button"   name="quiz2" onclick="document.getElementById('quiz_choice').value=1" value="X">
				<input type="hidden"  name="quiz_choice" id="quiz_choice" >
<%-- 				<input type="button" id="ansCheck" value="정답확인" onclick="anwCheck('<%=rs.getString("seqno") %>','<%=rs.getString("correct")%>','<%=ROOT%>')"> --%>
			
				<a href="quiznext.qo">다음문제</a>
			
			</form>
			
			
		
				
	</div>
</div>


	
    out.println("<script>");
    out.println("alert('수고하셨습니다.')");
    out.println("</script>");	
	response.sendRedirect(ROOT + "/index.jsp");
		
}

%>
<script>
function anwCheck(seqno,quiz_ans,root_path){

	
	
	var quiz_choice = document.getElementById("quiz_choice").value;
	var quiz_res;
	
	
	if(quiz_ans == quiz_choice){
		alert("정답입니다");
		quiz_res = 1;
	} else {
		alert("오답입니다");
		quiz_res = 0;
	}
	
	document.getElementById("detail").style.display = 'block';

	var x = new XMLHttpRequest();
	
	x.onreadystatechange = function(){
		//상태값 확인
		if(x.readyState === 4) {
			//서버로 부터 응답을 받은 경우			
			if(x.status ===200){
				//성공
			
				console.log('성공저장');
				
			} else {
				console.log('에러코드 :' + x.status);
				//에러코드 콘솔로 찍어보기
			}
		}
	};
	
	
	x.open("POST", root_path + "/quiz/mainProc.jsp", true);
		//	어떤방식인지	,어떤문서 요청  ,비동기 방식으로 요청
	x.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	x.send("a_sno=" + seqno+"&quiz_choice=" + quiz_choice + "&quiz_res=" + quiz_res);

}




</script>






<%@ include file="../projectfooter.jsp" %>




</body>
</html>
