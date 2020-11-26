<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String cmd = (String)session.getAttribute("cmd");
	request.setCharacterEncoding("UTF-8");
	if(cmd == null){
	cmd = "login";
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 결과</title>
</head>
<body>
<%System.out.println(cmd); %>
<%if(cmd.equals("delete")){
session.setAttribute("memberid", request.getParameter("inputid"));
session.setAttribute("isLoginOkay", "yes");%>
<script>
	alert('로그인 성공!');
	window.location.href='delete.jsp';
</script>
<%}else if(cmd.equals("update")){ 
session.setAttribute("memberid", request.getParameter("inputid"));
session.setAttribute("isLoginOkay", "yes");%>
<script>
	alert('로그인 성공!');
	window.location.href='updateform.jsp';
</script>
<%}else if(cmd.equals("login")){
	session.setAttribute("isLoginOkay", "yes");%>
<script>
	alert('로그인 성공!');
	window.location.href='view.jsp';
</script>
<%}else if(cmd.equals("logout")){
session.setAttribute("isLoginOkay", "no");
System.out.println("isLoginOkay="+(String)session.getAttribute("isLoginOkay"));%>
<script>
	alert('로그아웃 성공!');
	window.location.href='view.jsp';
</script>
<%}else if(cmd.equals("insert")){
	session.setAttribute("isLoginOkay", "yes");%>
<script>
	alert('로그인 성공!');
	window.location.href='insertform.jsp';
</script>
<%}else {%>
<script>
	alert('로그인 실패!');
	history.go(-1);
</script>
<%} %>

</body>
</html>