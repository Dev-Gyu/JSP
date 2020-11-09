<%@ page contentType="text/html; charset=UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="memberInfo" class="chap08.member.MemberInfo"/>
<jsp:setProperty name="memberInfo" property="*"/>
<jsp:setProperty name="memberInfo" property="password" value="${ memberInfo.id}"/>
<html>
<head>
<title>가입</title>
</head>
<body>
<table width="400" border="1" cellspacing="0" cellpadding="0">
<tr>
	<td>아이디</td>
	<td><jsp:getProperty name="memberInfo" property="id"/></td>
</tr>
<tr>
	<td>이름</td>
	<td>${memberInfo.name}</td>
</tr>
<tr>
	<td>비밀번호</td>
	<td><jsp:getProperty name="memberInfo" property="password"/></td>
</tr>
<tr>
	<td>이메일</td>
	<td><jsp:getProperty name="memberInfo" property="email"/></td>
</tr>
</table>
</body>
</html>