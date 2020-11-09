<%@ page contentType="text/html; charset=UTF-8"%>
<jsp:useBean id="member" class="chap08.member.MemberInfo" scope="request"/>
<html>
<head>
<title>인사말</title>
</head>
<body>

표현식으로 표시한 값<br>
<%=member.getId()%><br>
<%=member.getName()%>

</body>
</html>