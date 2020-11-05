<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.Enumeration"%>
<html>
<head>
<title>초기화 파라미터 읽어오기</title>
</head>
<body>
<h2>초기화 파라미터</h2>
<ul>
<%
	Enumeration<String> initParamEnum = application.getInitParameterNames();
	while(initParamEnum.hasMoreElements()){
	String initParamName = initParamEnum.nextElement();
%>
	<li>
	<%= initParamName %> =
	<%= application.getInitParameter(initParamName) %>
<% } %>
</ul>
</body>
</html>