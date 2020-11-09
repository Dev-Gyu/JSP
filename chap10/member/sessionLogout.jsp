<%@ page contentType="text/html; charset=UTF-8"%>
<%
	session.invalidate();
%>
<html>
<head>
<title>로그아웃 화면</title>
</head>
<body>
<script>
alert("로그아웃 했습니다.");
location.href="sessionLoginForm.jsp";
</script>
</body>
</html>