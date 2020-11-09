<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setAttribute("name","이규형");
%>
<html>
<head>
<title>EL Object</title>
</head>
<body>
요청 URI=${pageContext.request.requestURI}<br>
request객체의 name속성=${requestScope.name}<br>
code속성(아무것도 지정안했으므로 출력값 없음)=${param.code}
</body>
</html>