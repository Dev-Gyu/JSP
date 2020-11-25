<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 페이지</title>
</head>
<body>
<h2>로그인 정보를 입력해주세요</h2>
<hr>
<form method="POST" action="login.jsp">
<table border="1">
<tr><td><input type="text" name="inputid" size="20" required></td><tr>
<tr><td><input type="text" name="inputpw" size="20" required></td></tr>
<tr><td><input type="submit" value="로그인"><input type="reset" value="리셋"></td></tr>
</table>
</form>

</body>
</html>