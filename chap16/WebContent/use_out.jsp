<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="out" tagdir="/WEB-INF/tags" %>
<%@ page import="java.util.Date" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>out</title>
</head>
<body>
<h2>태그 바디에 있는 내용 그대로 출력</h2><br>
<out:out>
<jsp:body><u>현재 시간</u>은 <b>${dateEL }</b>입니다.</jsp:body>
</out:out><br>

<out:out>
<jsp:body><%= new Date() %><u>현재시간</u>은 <b>${dateEL }</b>입니다.</jsp:body>
</out:out>

</body>
</html>