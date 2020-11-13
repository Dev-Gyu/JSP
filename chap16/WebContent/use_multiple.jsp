<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tf" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카운트</title>
</head>
<body>
<h2>1부터 10까지 카운트</h2><hr>
<c:set var="num" value="${1}"/>
<tf:multiple count="10"/>
</body>
</html>