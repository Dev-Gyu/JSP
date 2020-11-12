<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>정보 입력 페이지</title>
</head>
<body>
<h2>정보를 입력해 주세요</h2>
<hr>
<form name="form1" method="POST" action="/chap14/insert/insert.jsp">
<table border="1">
	<tr>
		<td>아이디</td><td><input type="text" name="memberID" size="10"></td>
	</tr>
	<tr>
		<td>비밀번호</td><td><input type="text" name="password" size="10"></td>
	</tr>
	<tr>
		<td>이름</td><td><input type="text" name="name" size="20"></td>
	</tr>
	<tr>
		<td>이메일</td><td><input type="text" name="email" size="80"></td>
	</tr>	
	<tr>
		<td colspan="2"><input type="submit" value="입력"><input type="reset" value="취소"></td>
	</tr>
		
</table>

</form>

</body>
</html>