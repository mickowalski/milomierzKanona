<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
.
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Mile-o-meter</title>
    <%@ include file="../jspf/head_config.jspf" %>
</head>
<body style="background-color: lightsteelblue">
<%@ include file="../jspf/nav.jspf" %>
<p class="h1 text-center" style="font-family: 'Abril Fatface', cursive;">Milomierz</p>
<table class="table table-striped table-dark">
    <thead>
    <tr>
        <th scope="col">Miejsce</th>
        <th scope="col">Imię i nazwisko</th>
        <th scope="col">Ilość mil</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${mom}" var="m" varStatus="stat">
        <tr>
            <th scope="row"><c:out value="${stat.count}"/></th>
            <td><c:out value="${m[1]}"/> &nbsp; <c:out
                    value="${m[2]}"/></td>
            <td><c:out value="${m[3]}"/></td>
        </tr>
    </c:forEach>
    </tbody>
</table>
<%@ include file="../jspf/main_js.jspf" %>
</body>
</html>
