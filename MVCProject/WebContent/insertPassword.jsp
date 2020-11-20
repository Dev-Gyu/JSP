<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8");
	String cmd = request.getParameter("cmd");
	String head = null;
	if(cmd.equals("delete")){
		cmd = "delete.jsp";
		head = "게시글 삭제";
	}else if(cmd.equals("update")){
		cmd = "updateform.jsp";
		head = "게시글 수정";
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 입력 페이지</title>
</head>
<body>
<h2><%= head %></h2>
<h3>글 작성시 입력한 비밀번호를 입력해주세요.</h3>
<hr>
<form method="POST" action=" <%=cmd%> ">
<input type="hidden" name="guestid" value="<%= request.getParameter("guestid") %>">
	<table border="1" width="20%">
	<tr><td width="20%">비밀번호:</td><td><input type="password" name="password" size="20"></td>
	<tr><td colspan="2" align="center"><input type="submit" value="비밀번호 입력"><button type="button" onclick="location.href='view.jsp'">목록으로 돌아가기</button></td></tr>
	</table>
</form>

</body>
</html>