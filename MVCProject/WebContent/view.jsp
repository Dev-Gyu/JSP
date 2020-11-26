<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="mvc.vo.VOClass" %>
<%@ page import="mvc.vo.BoardVO" %>
<%@ page import="mvc.service.getRecordService" %>
<%@ page import="mvc.service.getAllBoardName" %>
<%@ page import="java.util.List" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	getRecordService getrecord = getRecordService.getInstance();
	getAllBoardName getallboardname = getAllBoardName.getInstance();
	List<VOClass> vo = getrecord.getAllRecords();
	List<BoardVO> boardVO = getallboardname.getAllBoardName();
%>
<c:set var="recordlist" value="<%= vo %>"/>
<c:set var="boardlist" value="<%= boardVO %>"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 목록 조회 페이지</title>
</head>
<body>
<c:if test="${sessionScope.isLoginOkay=='yes' }">
<h2>로그인 정보: 이규형님 환영합니다.<button type="button" onclick="location.href='loginform.jsp?cmd=logout'">로그아웃</button></h2>
</c:if>
<c:if test="${sessionScope.isLoginOkay!='yes' }">
<h2>로그인을 해주세요 &nbsp;&nbsp;<button type="button" onclick="location.href='loginform.jsp'">로그인</button></h2>
</c:if>
<hr>
<h2>메시지 내용</h2>
<button type="button" onclick="location.href='loginform.jsp?cmd=insert'">글쓰기</button>
<button type="button" onclick="location.href='createboardform.jsp?cmd=createboard'">게시판생성</button><p>
<h3>게시판목록</h3>
<c:forEach var="list" items="${boardlist }">
${list.boardName }
</c:forEach>
<hr>
<c:forEach var="list" items="${recordlist}">
<table border="1" width="40%">
<tr>
<td>
ID:${list.id}<br>
이름:${list.name}<br>
메시지:${list.message} <p>
</td></tr>
<tr>
<td width="100%" align="center">
<button type="button" onclick="location.href='loginform.jsp?guestid=${list.id}&cmd=update'">수정하기</button>
<button type="button" onclick="location.href='loginform.jsp?guestid=${list.id}&cmd=delete'">삭제하기</button>


</td>
</tr>
</table>
</c:forEach>

</body>
</html>