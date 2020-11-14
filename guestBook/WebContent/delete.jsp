<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="guestbook.service.DeleteMessageService" %>
<%@ page import="guestbook.service.GetMessageService" %>
<%@ page import="guestbook.vo.VOClass" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
	int guestid = Integer.parseInt(request.getParameter("guestid"));
	
	DeleteMessageService deleteService = DeleteMessageService.getDeleteService();
	GetMessageService getService = GetMessageService.getInstance();
	
	String inputPassword = request.getParameter("password");
	String messagePassword = getService.getOneVoclass(guestid).getPassword();
	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메시지 삭제 결과</title>
</head>
<body>
<%if(inputPassword.equals(messagePassword)){deleteService.messageDelete(guestid);%>
<h2>메시지 삭제에 성공 하였습니다.</h2>
<%}else{%>
<h2>비밀번호가 틀렸습니다.</h2>
<%} %>
<hr>
<a href="list.jsp">목록으로 돌아가기</a>

</body>
</html>