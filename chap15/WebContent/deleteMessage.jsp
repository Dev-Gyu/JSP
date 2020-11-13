<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="guestbook.service.DeleteMessageService" %>
<%@ page import="guestbook.service.ServiceException" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
	int messageid = Integer.parseInt(request.getParameter("messageId"));
	String password = request.getParameter("password");
	boolean invalidPassword = false;
	try{
		DeleteMessageService deleteService = DeleteMessageService.getDeleteMessageService();
		deleteService.delete(messageid, password);
		invalidPassword = true;
	}catch(ServiceException e){
		throw new ServiceException("에러발생"+e.getMessage(),e);
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>방명록 메시지 삭제결과</title>
</head>
<body>
<% if(invalidPassword){ %>
메세지 삭제에 성공하였습니다.
<% }else{ %>
비밀번호가 올바르지 않습니다.
<% } %>
<a href="list.jsp">목록으로 돌아가기</a>

</body>
</html>