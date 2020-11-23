<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="mvc.vo.VOClass" %>
<%@ page import="mvc.service.getRecordService" %>
<%@ page import="java.util.List" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	getRecordService service = getRecordService.getInstance();
	List<VOClass> vo = service.getAllRecords();
%>
<c:set var="list" value="<%= vo %>"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 목록 조회 페이지</title>
</head>
<body>
<h2>메시지 입력</h2>
<form method="POST" action="insert.jsp">
<input type="hidden" name="cmd" value="insert"/>
<table border="1" width="40%">
	<tr>
	<td width="20%" align="center">이름:</td><td><input type="text" name="name" size="20"></td>
	</tr>
	<tr>
	<td width="20%" align="center">비밀번호:</td><td><input type="password" name="password" size="20"></td>
	</tr>
	<tr>
	<td width="20%" align="center">메시지 내용:</td><td><textarea name="message" rows="3" cols="30"></textarea></td>
	</tr>
	<tr><td colspan="3" align="center"><input type="submit" value="메시지 입력"><input type="reset" value="리셋"></td></tr>
</table>
</form>
<hr><p>
<h2>메시지 내용</h2>
<hr>
<c:forEach var="list" items="${list}">
<table border="1" width="40%">
<tr>
<td>
ID:${list.id}<br>
이름:${list.name}<br>
메시지:${list.message} <p>
</td></tr>
<tr>
<td width="100%" align="center">
<button type="button" onclick="location.href='insertPassword.jsp?guestid=${list.id}&cmd=update'">수정하기</button>
<button type="button" onclick="location.href='insertPassword.jsp?guestid=${list.id}&cmd=delete'">삭제하기</button>
</td>
</tr>
</table>
</c:forEach>

</body>
</html>