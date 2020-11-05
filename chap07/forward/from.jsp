<%@ page contentType="text/html; charset=UTF-8"%>
<%--
	<jsp:forward>액션 태그를 실행하면
	생성했던 모든 출력 결과는 제거된다.
--%>
<html>
<head>
<title>from.jsp의 제목</title>
</head>
<body>
이 페이지는 from.jsp가 생성 한 것입니다.

<jsp:forward page="to/to.jsp"/>
</body>
</html>