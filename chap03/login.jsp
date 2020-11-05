<%@ page contentType="text/html; charset=UTF-8"%>
<html>
<head>
<title>로그인 페이지</title>
<%
	String id = request.getParameter("memberId");
	if(id != null && id.equals("madvirus")){
	response.sendRedirect("index.jsp");
	}
	else{
%>
</head>
<body>
	<h2>잘못된 아이디입니다.</h2>
</body>
</html>

<%
}
%>