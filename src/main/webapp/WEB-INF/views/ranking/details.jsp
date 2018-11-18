<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Details of </title>
    <%@ include file="../jspf/head_config.jspf" %>
</head>
<body>
<div class="container">
    <div class="row align-items-start">
        <c:forEach items="${details}" var="detail">
        <div class="col">
            <c:out value="${detail[1]}"/>
        </div>
        </c:forEach>
        <div class="col">
        </div>
<%@ include file="../jspf/main_js.jspf" %>
</body>
</html>
<%--       --%>