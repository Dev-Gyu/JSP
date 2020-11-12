<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<title>if 태그</title>
</head>
<body>
<c:if test="true">
항상 실행하는 조건<p>
</c:if>

<c:if test="${param.name == 'bk'}">
name값은 ${param.name}입니다<p>
</c:if>

<c:if test="${param.age == '18'}" var="ang">
age값은 ${param.age}입니다.<br>
var값 = ${ang}
</c:if>
</body>
</html>
