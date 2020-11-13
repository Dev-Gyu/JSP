<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="select" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>동적 속성 사용</title>
</head>
<body>
<select:select name="code" rgb="RGB모드" black="흑백 모드"/>
<select:select name="genre" rock="락" metal="메탈" classic="클래식"/>

</body>
</html>