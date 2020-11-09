<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import = "util.Cookies"%>
<%
	Cookies cookies = new Cookies(request);
%>
<html>
<head>
<title>Cookie 사용</title>
</head>
<body>
name 쿠키 = <%= cookies.getValue("name")%>
<% if(cookies.exist("id")){
id 쿠키 = <%= cookies.getValue("id")%> <br>
<% } %>
</body>
</html>