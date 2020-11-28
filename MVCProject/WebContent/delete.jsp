<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="mvc.service.deleteRecordService" %>
<%@	page import="mvc.service.getRecordService" %>
<%@ page import="mvc.vo.VOClass" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
	int guestid = Integer.parseInt((String)session.getAttribute("guestid"));
	String password = request.getParameter("password");
	String isLoginOkay = (String)session.getAttribute("isLoginOkay");
	String boardName = (String)session.getAttribute("nowBoardName");
	int isSuccess = 0;
	
	deleteRecordService delete = deleteRecordService.getInstance();
	getRecordService get = getRecordService.getInstance();
	VOClass vo = get.getOneRecord(guestid, boardName);
	if(isLoginOkay.equals("yes")){
		isSuccess = delete.deleteRecord(vo.getId(), boardName);
	}
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>삭제 결과</title>
</head>
<body>
<c:if test='<%=isSuccess != 0%>'>
<script>
	alert('삭제 성공!');
	location.href = "view.jsp";
</script>
</c:if>

<c:if test='<%=isSuccess == 0%>'>
<script>
	alert('삭제동작중 에러가 발생하였습니다.');
	history.go(-1);
</script>
</c:if>

<button type="button" onclick="location.href='view.jsp'">목록으로 돌아가기</button>
</body>
</html>