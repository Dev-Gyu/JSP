<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page autoFlush="true"%>
<html>
<head>
<title>버퍼 사이즈 관련 출력메소드</title>
</head>
<body>
	지정된 버퍼 크기= <%= out.getBufferSize() %><br>
	현재 남은 버퍼 크기= <%= out.getRemaining() %><br>
	버퍼 오토플러쉬 했는지?(autoFlush - true)= <%= out.isAutoFlush() %>
</body>
</html>