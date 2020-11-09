<%@ page contentType="text/html; charset=UTF-8"%>
<jsp:useBean id="member" class="chap08.member.MemberInfo" scope="request"/>
<%
member.setId("gyus");
member.setName("규형");
%>
<jsp:forward page="/useObject.jsp"/>
