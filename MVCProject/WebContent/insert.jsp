<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="mvc.vo.VOClass" %>
<%@ page import="mvc.service.insertRecordService" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
	VOClass vo = new VOClass();
	insertRecordService insert = insertRecordService.getInstance();
	int isSuccess = 0;
	
	vo.setPassword(request.getParameter("password"));
	vo.setName(request.getParameter("name"));
	vo.setMessage(request.getParameter("message"));
	isSuccess = insert.insertRecord(vo, isSuccess);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메시지 입력 결과 페이지</title>
</head>
<body>
<c:if test="<%= isSuccess != 0 %>">
<script>
	alert('메시지 입력에 성공하였습니다.');
	window.location.href='view.jsp';
</script>
</c:if>

<c:if test="<%= isSuccess == 0 %>">
<script>
	alert('메시지 입력에 성공하였습니다.');
	window.location.href='view.jsp';
</script>
</c:if>

<button type="button" onclick="location.href='view.jsp'">목록 페이지로</button>


</body>
</html>