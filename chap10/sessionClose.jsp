<%@ page contentType="text/html; charset=UTF-8"%>
<html>
<head>
<title>세션종료</title>
</head>
<body>
<%
	session.invalidate();
%>
세션이 종료 되었습니다.
</body>
</html>