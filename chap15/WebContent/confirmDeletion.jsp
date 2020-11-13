<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 삭제 비밀번호 입력 페이지</title>
</head>
<body>
<form action="deleteMessage.jsp" method="POST">
메세지를 삭제하시려면 비밀번호를 입력하세요.<br>
<input type="hidden" name="messageId" value="${param.messageId}">
암호: <input type="text" name="password">
<input type="submit" value="삭제">
</form>

</body>
</html>