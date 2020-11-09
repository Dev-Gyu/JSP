<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setAttribute("name","이규형");
	request.setAttribute("age", 27);
%>

이름: ${requestScope.name}<br>
나이: ${requestScope.age}<p>
이름(나이): ${requestScope.name += "(" += age += ")"}