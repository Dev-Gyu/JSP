<%@ page contentType="text/html; charset=UTF-8"%>
<html>
<head>
<title>에러 페이지</title>
</head>
<body>
요청 처리 과정에서 에러가 발생하였습니다.<br>
빠른 시일 내 문제를 해결 하겠습니다.
<p> 에러 타입: <%= exception.getClass().getName() %> <br>
에러 메시지: <b><%= exception.getMessage()%> </b>
</body>
</html>