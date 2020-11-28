<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="mvc.vo.VOClass" %>
<%@ page import="mvc.vo.BoardVO" %>
<%@ page import="mvc.service.getRecordService" %>
<%@ page import="mvc.service.getAllBoardName" %>
<%@ page import="java.util.List" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String nowBoardName =request.getParameter("board");
	boolean isFirstConnection = false;
	if(nowBoardName == null){
		if(session.getAttribute("nowBoardName") == null){
			nowBoardName = "guestbook";
		}else{
			nowBoardName = (String)session.getAttribute("nowBoardName");
		}
	}

	getRecordService getrecord = getRecordService.getInstance();
	getAllBoardName getallboardname = getAllBoardName.getInstance();
	
	
	List<VOClass> vo = getrecord.getAllRecords(nowBoardName);
	List<BoardVO> boardVO = getallboardname.getAllBoardName();
	
	session.setAttribute("nowBoardName", nowBoardName);
%>
<c:set var="recordlist" value="<%= vo %>"/>
<c:set var="boardlist" value="<%= boardVO %>"/>
<!DOCTYPE html>
<html>
<head>
<style>
	body{
	background-color: papayawhip;
	background-image: url("backgroundimage/fischl.png");
	background-position: right bottom;
	background-repeat: no-repeat;
	background-attachment: fixed;
	}
	h1{
	text-align: center;
	}
	h2{
	text-align: right;
	}
</style>
<meta charset="UTF-8">
<title>글 목록 조회 페이지</title>
</head>
<body>
<h1>개발자 규형 키우기</h1>
<c:if test="${sessionScope.isLoginOkay=='yes' }">
<h2>로그인 정보: 이규형님 환영합니다.<button type="button" onclick="location.href='loginform.jsp?cmd=logout'">로그아웃</button></h2>
</c:if>
<c:if test="${sessionScope.isLoginOkay!='yes' }">
<h2>로그인을 해주세요 &nbsp;&nbsp;<button type="button" onclick="location.href='loginform.jsp'">로그인</button></h2>
</c:if>
<hr>


<h3>게시판목록</h3>
<c:forEach var="list" items="${boardlist }">
<a href="view.jsp?board=${list.boardName }">${list.boardName }</a>
</c:forEach><p>
<b>현재 게시판</b>: <%=nowBoardName %>
<p>
<button type="button" onclick="location.href='createboardform.jsp?cmd=createboard'">게시판생성</button>
<button id="deleteBoard" type="button" >게시판 삭제</button>
<script>
	document.getElementById("deleteBoard").onclick = function(){myfunction()};
	function myfunction() {
		var confirmFlag = confirm("게시판을 삭제하시겠습니까?");
		if(confirmFlag){
			window.location.href='deleteBoard.jsp';
		}else{}
	}
</script>
<hr>


<h3>메시지 내용</h3>
<button type="button" onclick="location.href='loginform.jsp?cmd=insert'">글쓰기</button>
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
<button id="recordDelete" type="button" onclick="location.href='loginform.jsp?guestid=${list.id}&cmd=delete'">삭제하기</button>


</td>
</tr>
</table>
</c:forEach>

</body>
</html>