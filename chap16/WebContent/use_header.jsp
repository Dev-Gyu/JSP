<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="header" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제목 출력</title>
</head>
<body>
<header:header title="텍스트제목" level="2"/>
<header:header title="${'EL 제목' }" level="3"/>
<header:header title='<%= "표현식 제목"%>' level="1"/>

</body>
</html>