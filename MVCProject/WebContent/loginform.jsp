<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	if(request.getParameter("cmd") == null){
		session.setAttribute("cmd", "login");
	}else if(request.getParameter("cmd") != null){
		
	String cmd = request.getParameter("cmd");
	session.setAttribute("cmd", cmd);
	session.setAttribute("guestid", request.getParameter("guestid"));
	if((String)session.getAttribute("isLoginOkay") == "yes"){
		if(cmd.equals("update")){
		response.sendRedirect("updateform.jsp");
		return;
		}else if(cmd.equals("delete")){
			response.sendRedirect("delete.jsp");
			return;
		}else if(cmd.equals("insert")){
			response.sendRedirect("insertform.jsp");
			return;
		}else{
			response.sendRedirect("login.jsp");
			return;
		}
	}
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 페이지</title>
</head>
<body>
<h2>로그인 정보를 입력해주세요</h2>
<hr>
<form method="POST" action="login.jsp">
<table border="1">
<tr><td><input type="text" name="inputid" size="20" required></td><tr>
<tr><td><input type="text" name="inputpw" size="20" required></td></tr>
<tr><td><input type="submit" value="로그인"><input type="reset" value="리셋"></td></tr>
</table>
</form>

</body>
</html>