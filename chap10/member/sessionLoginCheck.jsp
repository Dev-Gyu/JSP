<%@ page contentType="text/html; charset=UTF-8"%>
<%
	String login = (String)session.getAttribute("MEMBERID");
	boolean islogin = login == null ? false:true;
%>
<html>
<head>
<title>로그인 여부 확인</title>
</head>
<body>

<% if(islogin){ %> <!-- 로그인 실패했거나 안 했을시 -->
<%= login %> 님 반갑습니다.
<button type="button" onclick="location.href='sessionLogout.jsp'">로그아웃</button>

<% }else{ %> <!-- 로그인 성공했을 시 -->
<script>
alert("로그인 하시기 바랍니다.");
history.go(-1);
</script>
<% } %>
</body>
</html>