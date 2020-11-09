<%@ page contentType="text/html; charset=UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="requestBean" class="Study.bin.RequestBean"/>
<jsp:setProperty name="requestBean" property="*"/>
<html>
<head>
<title>정보 표시 페이지</title>
</head>
<body>
<h2>입력 정보를 표시합니다.</h2>
<hr><p>

<table border="1" cellspacing="0" cellpadding="0">
<tr>
	<td>이름</td>
	<td><%= requestBean.getName()%></td>
</tr>
<tr>
	<td>주소</td>
	<td>${requestBean.address}</td>
</tr>
<tr>
	<td>이메일</td>
	<td><%= requestBean.getEmail()%></td>
</tr>
</table>
</body>
</html>
