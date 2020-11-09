<%@ page contentType="text/html; charset=UTF-8"%>
<%
	String id = request.getParameter("id");
	String password = request.getParameter("password");
	if(id.equals(password)){
	session.setAttribute("MEMBERID", id);
%>
<html>
<head>
<title>로그인 성공</title>
</head>
<body>

<script>
alert("로그인에 성공하였습니다.");
location.href = "sessionLoginCheck.jsp";
</script>

</body>
</html>
<% }else{ %> <!-- 로그인 실패시 -->
<html>
<title>로그인 실패</title>
</head>
<body>

<script>
alert("로그인에 실패하였습니다.");
history.go(-1);
</script>

</body>
</html>
<% } %>