<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cmd = (String)session.getAttribute("cmd");
	session.setAttribute("guestid", request.getParameter("guestid"));
	session.setAttribute("cmd", cmd);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 결과</title>
</head>
<body>
<%System.out.println(cmd); %>
<%if(cmd.equals("delete")){%>
<script>
	alert('로그인 성공!');
	window.location.href='delete.jsp';
</script>
<%}else if(cmd.equals("update")){ %>
<script>
	alert('로그인 성공!');
	window.location.href='updateform.jsp';
</script>
<%}else{ %>
<script>
	alert('로그인 실패!');
	history.go(-1);
</script>
<%} %>

</body>
</html>