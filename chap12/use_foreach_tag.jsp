<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.HashMap"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<title>forEach 태그</title>
</head>
<body>
<%
	HashMap<String, Object> hashmap = new HashMap<String, Object>();
	hashmap.put("name", "이규형");
	hashmap.put("today", new java.util.Date());
%>
<c:set var="intArray" value="<%= new int[] {1,2,3,4,5} %>"/>
<c:set var="map" value="<%= hashmap %>"/>

<h4>1부터 100까지 홀수의 합</h4>
<c:set var="sum" value="0"/>
<c:forEach var="i" begin="1" end="100" step="2">
<c:set var="sum" value="${sum + i}"/>
</c:forEach>
결과 = ${sum}
<hr>

<h4>구구단 4단</h4>
<c:forEach var="i" begin="1" end="9">
4 * ${i} = ${4 * i}<br>
</c:forEach>
<hr>

<h4>int형 배열</h4>
1부터 5까지 더한값
<c:forEach var="sum" items="${intArray}" varStatus="status">
${status.index}-${status.count}-${sum} <br>
</c:forEach>
<hr>

<h4>Map</h4>
<c:forEach var="i" items="${map}">
${i.key} = ${i.value}<br>
</c:forEach>
</body>
</html>