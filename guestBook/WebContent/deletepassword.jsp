<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메시지 삭제 비밀번호 입력</title>
</head>
<body>
<h2>${param.guestid }번 메시지 삭제</h2>
<h3>메시지 등록시 입력한 비밀번호를 입력하세요.</h3>
<hr>
<form method="POST" action="delete.jsp">
	<input type="hidden" name="guestid" value="${param.guestid}">
	<input type="password" name="password" size="20"><br>
	<input type="submit" value="삭제">
</form>


</body>
</html>