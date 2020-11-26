<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 작성 페이지</title>
</head>
<body>
<h2>메시지 입력</h2>
<form method="POST" action="insert.jsp">
<input type="hidden" name="cmd" value="insert"/>
<table border="1" width="40%">
	<tr>
	<td width="20%" align="center">이름:</td><td><input type="text" name="name" size="20"></td>
	</tr>
	<tr>
	<td width="20%" align="center">비밀번호:</td><td><input type="password" name="password" size="20"></td>
	</tr>
	<tr>
	<td width="20%" align="center">메시지 내용:</td><td><textarea name="message" rows="3" cols="30"></textarea></td>
	</tr>
	<tr><td colspan="3" align="center"><input type="submit" value="메시지 입력"><input type="button" onclick="location.href='view.jsp'" value="목록으로 돌아가"></td></tr>
</table>
</form>

</body>
</html>