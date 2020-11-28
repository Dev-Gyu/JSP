<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="mvc.vo.VOClass" %>
<%@ page import="mvc.service.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
	int guestid = Integer.parseInt((String)session.getAttribute("guestid"));
	String password = request.getParameter("password");
	String message = request.getParameter("message");
	String nowBoardName = (String)session.getAttribute("nowBoardName");
	
	getRecordService get = getRecordService.getInstance();
	updateRecordService update = updateRecordService.getInstance();
	VOClass vo = get.getOneRecord(guestid, nowBoardName);
	
		vo.setMessage(message);
		update.updateRecord(vo);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수정 결과 페이지</title>
</head>
<body>
<script>
	alert('수정 성공!')
	location.href="view.jsp"
</script>

</body>
</html>