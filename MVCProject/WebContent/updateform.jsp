<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="mvc.vo.VOClass" %>
<%@ page import="mvc.service.getRecordService" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
	int guestid = Integer.parseInt((String)session.getAttribute("guestid"));
	String password = request.getParameter("password");
	int isPasswordMatch = 0;
	String nowBoardName = (String)session.getAttribute("nowBoardName");
	
	getRecordService get = getRecordService.getInstance();
	
	VOClass vo = get.getOneRecord(guestid, nowBoardName);
	if(session.getAttribute("isLoginOkay").equals("yes")){
		isPasswordMatch = 1;
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 수정 페이지</title>
</head>
<body>
<c:if test="<%=isPasswordMatch == 1 %>">
<h2>게시글 내용 수정</h2><hr>
<h3>기존 내용</h3>
<form method="POST" action="update.jsp">
<input type="hidden" name="guestid" value="<%=vo.getId()%>">
<input type="hidden" name="password" value="<%=password%>">
<input type="hidden" name="name" value="<%=vo.getName() %>">
	<table border="1" width="40%">
		<tr><td width="10%">메시지</td><td><textarea name="message" cols="30" rows="3"><%= vo.getMessage() %></textarea></td></tr>
		<tr><td colspan="2"><input type="submit" value="수정"><input type="button" onclick="location.href='view.jsp'" value="취소"></td></tr>
	</table>
</form>
</c:if>
<c:if test="<%=isPasswordMatch != 1 %>">
<script>
	alert('로그인 실패!');
	history.go(-1);
</script>
</c:if>

</body>
</html>