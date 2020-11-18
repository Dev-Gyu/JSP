<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 정보 입력 페이지</title>
</head>
<body>
<h2>로그인 정보를 입력해주세요</h2>
<hr>
<form action ="<%=request.getContextPath() %>/login.jsp" method="POST">
	아이디<input type="text" name="memberId">
	암호<input type="text" name="memberPassword">
	<input type="submit" value="로그인">
	
</form>

</body>
</html>