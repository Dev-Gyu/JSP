<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="guestbook.vo.VOClass" %>
<%@ page import="guestbook.service.GetMessageService" %>
<%@ page import="java.util.List" %>

<%
	GetMessageService getMessage = GetMessageService.getInstance();
	List<VOClass> list = getMessage.getAllVoclass();
%>
<c:set var="list" value="<%= list %>"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메세지 리스트</title>
</head>
<body>
<form method="POST" action="write.jsp">
<table border="1">
	<tr><td>이름: </td><td><input type="text" name="name" size="20"></td></tr>
	<tr><td>비밀번호: </td><td><input type="password" name="password" size="20"></td></tr>
	<tr><td>메시지: </td><td><textarea name="message" cols="20" rows="3"></textarea></td></tr>
	<tr><td><input type="submit" value="메시지 등록"></td></tr>
</table>
</form>
<hr>
<h2>메시지 로그</h2>
<c:if test="${list.isEmpty()}">
<h2>등록된 메시지가 없습니다.</h2>
</c:if>
<c:if test="${!list.isEmpty()}">
<table border="1">
<c:forEach var="message" items="${list}">
	<tr>
		<td>
		메세지번호: ${message.id}<br/>
		이름: ${message.name}<br/>
		메세지: ${message.message}<br/>
		<a href="deletepassword.jsp?guestid=${message.id}">삭제하기</a>
		</td>
	</tr>	
</c:forEach>
</table>
</c:if>

</body>
</html>