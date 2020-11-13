<%@ tag language="java" pageEncoding="UTF-8" body-content="empty"%>
<%@ tag import="java.util.Calendar"%>
<%
	Calendar cal = Calendar.getInstance();
%>
<b>
<%=cal.get(Calendar.YEAR)%>년
<%=cal.get(Calendar.MONTH)%>월
<%=cal.get(Calendar.DATE)%>일</b> 이며,<br>
현재 시각은
<b>
<%=cal.get(Calendar.HOUR)%>시
<%=cal.get(Calendar.MINUTE)%>분
<%=cal.get(Calendar.SECOND)%>초 </b>