<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Details of </title>
    <%@ include file="../jspf/head_config.jspf" %>
</head>
<body>
<%@ include file="../jspf/nav.jspf" %>
<table class="table table-striped table-dark">
    <thead>
    <tr>
        <th scope="col">Rejs</th>
        <th scope="col">Rejs</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${details}" var="var" varStatus="stat">
        <tr>

            <td><c:out value="${var[3]}"/></td>
        </tr>
    </c:forEach>
    </tbody>
</table>
<%@ include file="../jspf/main_js.jspf" %>
</body>
</html>
