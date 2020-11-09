<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.*" %>
<html>
<head>
	<title>리퀘스트 받는 페이지</title>
	<% request.setCharacterEncoding("UTF-8"); %>
</head>
<body>
<h2>리퀘스트 받은 항목들</h2>

입력받은 값들의 이름: <%
Enumeration e = request.getParameterNames();
while(e.hasMoreElements()){
String name = (String)e.nextElement();
if(e.hasMoreElements())
out.println(name + ", ");
else
out.println(name + "<p>");
}
%>

이름: <%= request.getParameter("name") %><br>
주소: <%= request.getParameter("address") %><br>
전화번호: <%= request.getParameter("phoneNumber")%><br>
이메일: <%= request.getParameter("email")%><p>

<input type=button onclick="history.back()" value="이전 페이지로">

</body>
</html>