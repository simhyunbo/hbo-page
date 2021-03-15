<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page import="org.apache.commons.fileupload.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>       
   


<%-- <% --%>

<%-- %> --%>

<%@ include file="../project_header.jsp" %>
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


<title>게시판 세부내용</title>

<style>
body, html {height: 100%}
body,h1,h2,h3,h4,h5,h6 {font-family: "Amatic SC", sans-serif}
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

		<h2>게시판 세부내용</h2>
		
	
	
		
		<div style = "margin-top:50px;">
			
			<table>
				<c:set value="${board}" var="dto"/>
				<thead>	
					<tr>
						<td style="text-align:left">${dto.title}</td>
						<td style="text-align:right">조회수 : ${dto.count}</td>
					</tr>
					<tr>
						<td style="text-align:left">작성자 : ${dto.id}</td>
						<td style="text-align:right">${dto.wdate}</td>
					</tr>
					<tr style="height:300px; vertical-align: top; background-color: #f5f5f5">
						<td colspan="2" style="text-align:left; padding-top:20px;">
						${dto.content}
						</td>
					</tr>
					<c:if test="${dto.upfile.fileName != null }">
					<tr>
					<c:set value="${ dto.upfile.fileType}" var="ftype" />
					<c:set value="${fn:substring(ftype, 0,fn:indexOf(ftype,'/') ) }" var="type"/>
					
						<td colspan="2" style="text-align:left"> 첨부파일 : 	
						
							<form name="filedown" method="post" action="/download">		
								
								<input type="hidden" name="savefilename" value="${board.upfile.saveFileName}">
								
								<input type="hidden" name="filepath" value="${board.upfile.filePath}">	
								
								
								<c:if test="${ type eq 'image'}">
									<img width="100px" height="100px" src="/upload/${board.upfile.saveFileName }" />
								</c:if>
								${board.upfile.fileName } (사이즈: ${board.upfile.fileSize }) 	
								
								<input type="submit" value="다운로드" >								
							</form>
							
							
						</td>
					</tr>
					</c:if>				
				</thead>						
			</table>
			
			<c:if test="${dto.id == sess_id}">
				<form name="boardModifyBtn" method="POST" action="/board/boardModifyForm">
                 				
				<input type="hidden" name="bno" value="${dto.bno}">
				<input type="hidden" name="title" value="${dto.title}">
				<input type="hidden" name="content" value="${dto.content}">
				<input type="hidden" name="count" value="${dto.count}">
				<input type="hidden" name="wdate" value="${dto.wdate}">
				<input type="hidden" name="writer" value="${dto.id}">
				
				<input type="hidden" name="fileNo" value="${board.upfile.fileNo}">
				<input type="hidden" name="saveFileName" value="${board.upfile.saveFileName }">
				<input type="hidden" name="fileName" value="${board.upfile.fileName}">
				<input type="hidden" name="fileSize" value="${board.upfile.fileSize}">
				<input type="hidden" name="fileType" value="${board.upfile.fileType}">
                  <input type="submit" value="수정">
               </form>
				<form name="boardDelBtn" method="POST" action="/board/delete" onsubmit="return checkYesNo()">
					<input type="hidden" name="bno" value="${dto.bno}">
					<input type="hidden" name="saveFileName" value="${board.upfile.saveFileName }">
					
					<input type="submit" value="삭제">
				</form>	
			</c:if>
			
	
		

				
			</div>
	</div>







<%@ include file="../projectfooter.jsp" %>




</body>
</html>
