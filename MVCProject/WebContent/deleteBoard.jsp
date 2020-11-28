<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="mvc.vo.BoardVO" %>
<%@ page import="mvc.service.DeleteBoardService" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<%
	request.setCharacterEncoding("UTF-8");
	String nowBoardName = (String)session.getAttribute("nowBoardName");
	int isSuccess = 0;
	DeleteBoardService deleteBoard = DeleteBoardService.getInstance();
	isSuccess = deleteBoard.deleteBoard(nowBoardName);
	
%>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 삭제 페이지</title>	
</head>
<body>
<c:if test="${isSuccess == 0 }">
<script>
	alert('게시판 삭제 실패!');
	window.location.href='view.jsp?';
</script>
</c:if>

<c:if test="${isSuccess != 0 }">
<script>
	alert('게시판 삭제 성공!');
	window.location.href='view.jsp'
</script>
</c:if>
</body>
</html>