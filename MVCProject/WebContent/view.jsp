<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="mvc.vo.VOClass" %>
<%@ page import="mvc.service.ConnectionTest" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	int guestid = Integer.parseInt(request.getParameter("guestid"));
	ConnectionTest service = ConnectionTest.getInstance();
	VOClass vo = service.getOneRecord(guestid);
%>
<c:set var="id" value="<%=vo%>"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 목록 조회 페이지</title>
</head>
<body>
<h2>메시지 내용</h2>
<hr>
ID:${id.id}<br>
이름:${id.name}<br>
메시지:${id.message }<br>

</body>
</html>