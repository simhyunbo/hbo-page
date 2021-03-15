<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/mysql_conn.jsp" %>

<%


request.setCharacterEncoding("UTF-8");



String id = (String)session.getAttribute("sess_id");
String seqno = request.getParameter("a_sno");
String che = request.getParameter("quiz_choice");
String quiz_ans = request.getParameter("quiz_res");




String sql2 = "INSERT INTO answer (id, a_sno ,ans, correct) VALUES(?,?,?,?)";
PreparedStatement stmt2 = conn.prepareStatement(sql2);
stmt2.setString(1, id);
stmt2.setString(2, seqno);
stmt2.setString(3, che);
stmt2.setString(4, quiz_ans);


System.out.println(stmt2);

int rec = stmt2.executeUpdate();



	




%>
    