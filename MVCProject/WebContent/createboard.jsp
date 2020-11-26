<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="mvc.vo.BoardVO" %>
<%@ page import="mvc.service.CreateBoardService" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
	BoardVO vo = new BoardVO();
	vo.setBoardName(request.getParameter("boardName"));
	vo.setNameType(request.getParameter("nameType"));
	CreateBoardService createBoard = CreateBoardService.getInstance();
	int isSuccess = createBoard.createBoard(vo);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 생성 결과</title>
</head>
<body>
<c:if test="${isSuccess == 0}">
<script>
	alert('게시판 생성에 실패하였습니다.');
	history.go(-1);
</script>
</c:if>
<c:if test="${isSuccess != 0}">
<script>
	alert('게시판 생성 성공!');
	window.location.href='view.jsp';
</script>
</c:if>
</body>
</html>