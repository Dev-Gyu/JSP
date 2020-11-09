<%@ page contentType="text/html; charset=UTF-8"%>
<html>
<head>
<title>정보 입력 페이지</title>
</head>
<body>
<form name="form1" method="POST" action="readPage.jsp">
<table border="1" cellspacing="0" cellpadding="0">
<tr>
	<td>이름</td>
	<td><input type="text" name="name"></td>
</tr>
<tr>
	<td>주소</td>
	<td><input type="text" name="address"></td>
</tr>
<tr>
	<td>이메일</td>
	<td><input type="text" name="email"></td>
</tr>
<tr>
	<td colspan="1"><input type="submit" value="입력"></td>
</tr>
</table>
</form>
</body>
</html>