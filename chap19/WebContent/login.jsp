<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%
    request.setCharacterEncoding("UTF-8");
    String memberId = request.getParameter("memberId");
    session.setAttribute("MEMBER", memberId);
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<body>
<%if(session.getAttribute("MEMBER").equals("member")){%>
<script>
	alert('로그인 성공!!');
	location.href='<%=request.getContextPath()%>/board/boardList.jsp'
</script>
<%}else{%>
<script>
	alert('로그인 실패!!');
	history.go(-1);
</script>
<%} %>

</body>
</html>