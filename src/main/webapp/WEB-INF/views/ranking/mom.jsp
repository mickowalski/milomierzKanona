<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
<div>
    <form:form modelAttribute="dateForm" method="post">
        <label for="pastDate">Wprowadź datę aby sprawdzić rankingna dany dzień</label>
        <input type="date" id="pastDate" name="pastDate"/>
        <input type="submit" value="Sprawdź">
        <input type="button" value="Reset" onclick="location.href='/customers/ranking'"/>
    </form:form>
</div>
<p>
<h4><c:out value="${headerText}"/></h4>
</p>
<table class="table table-striped table-dark">
    <thead>
    <tr>
        <th scope="col">Miejsce</th>
        <th scope="col">Imię i nazwisko</th>
        <th scope="col">Ilość mil</th>
        <th scope="col"></th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${mom}" var="mom" varStatus="stat">
        <tr>
            <th scope="row"><c:out value="${stat.count}"/></th>
            <td><a href="/customers/ranking/details?id=${mom[0]}"><c:out value="${mom[1]}"/> &nbsp; <c:out
                    value="${mom[2]}"/> </a></td>
            <td><c:out value="${mom[4]}"/></td>
            <td><c:out value="${mom[3]}"/></td>
        </tr>
    </c:forEach>
    </tbody>
</table>
<%@ include file="../jspf/main_js.jspf" %>
</body>
</html>
