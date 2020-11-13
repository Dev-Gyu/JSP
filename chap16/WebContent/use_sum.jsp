<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tf" tagdir="/WEB-INF/tags/" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>합계 구하기</title>
</head>
<body>
<h2>합계</h2><hr>
<tf:sum begin="1" end="10">
1부터 10까지의 합 = ${sum}
</tf:sum>

</body>
</html>