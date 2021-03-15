<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String ROOT = request.getContextPath();

	String sess_id =(String)session.getAttribute("sess_id");
 	String sess_name =(String)session.getAttribute("sess_name");
 	boolean isLogin = false;
 	if(sess_name != null){
		isLogin = true;
	}
	
 	
 
%>


<link rel="stylesheet" href="<%=ROOT %>/layout_css.css">




<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">