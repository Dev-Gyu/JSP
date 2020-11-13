<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ attribute name="count" required="true" type="java.lang.Integer" %>

<c:forEach var="num" begin="${1}" end="${count}">
	${num }<br>
</c:forEach>