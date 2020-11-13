<%@ tag language="java" pageEncoding="UTF-8" body-content="tagdependent"%>
<%@ tag trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:doBody var="bodyText"/>
<c:out value="${bodyText }" escapeXml="true"/>
