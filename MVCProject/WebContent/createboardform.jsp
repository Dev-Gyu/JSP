<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 생성 페이지</title>
</head>
<body>
<h2>게시판 정보 입력</h2>
<hr>
<p>
<form method="POST" action="createboard.jsp">
<table border="1" width="30%">
	<tr>
	<td width="20%">게시판명</td><td><input type="text" name="boardName"></td>
	</tr>
	<tr>
	<td>작성자명 타입</td>
	<td><select name="nameType">
		<option value="VARCHAR(20)">20글자</option>
		<option value="TEXT">텍스트</option>
		</select>
	</td>
	</tr>
	<tr>
	<td colspan="2"><input type="submit" value="생성"><input type="button" onclick="location.href='view.jsp'" value="목록으로 돌아가기"></td>
	</tr>
</table>
</form>

</body>
</html>