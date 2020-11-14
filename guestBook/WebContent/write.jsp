<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="guestbook.service.WriteMessageService" %>
<%@ page import="guestbook.vo.VOClass" %>
<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="voclass" class="guestbook.vo.VOClass">
<jsp:setProperty name="voclass" property="*"/>
</jsp:useBean>
<%
	WriteMessageService writeMessage = WriteMessageService.getInstance();
	writeMessage.write(voclass);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메세지 입력 완료</title>
</head>
<body>
<h2>메세지가 정상적으로 입력되었습니다.</h2>
<hr>
<a href="list.jsp">목록 화면 으로</a>

</body>
</html>