<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Mile-o-meter</title>
    <%@ include file="../jspf/head_config.jspf" %>
</head>
<body>
<c:choose>
    <c:when test="${logged != null}">
        <%@include file="../jspf/pastnav.jspf" %>
    </c:when>
    <c:otherwise>
        <%@include file="../jspf/empty_nav.jspf" %>
    </c:otherwise>
</c:choose>
<p class="h1 text-center" style="font-family: 'Tajawal', sans-serif;"><i class="icon ion-ios-speedometer"></i>Milomierz
</p>
<div>
    <form:form modelAttribute="dateForm" method="post">
        <label for="pastDate">Wprowadź datę aby sprawdzić ranking na dany dzień</label>
        <div class="introduction-data">
        <input type="date" id="pastDate" name="pastDate"/>
        <input type="submit" value="Sprawdź">
        <input type="button" value="Reset" onclick="location.href='/customers/ranking'"/>
        </div>
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
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${mom}" var="mom" varStatus="stat">
        <tr>
            <th scope="row"><c:out value="${stat.count}"/></th>
            <td><a href="/customers/ranking/details?id=${mom[0]}"><c:out value="${mom[1]}"/> &nbsp; <c:out
                    value="${mom[2]}"/> </a></td>
            <td><c:out value="${mom[4]}"/></td>
        </tr>
    </c:forEach>
    </tbody>
</table>
<%@ include file="../jspf/main_js.jspf" %>
</body>
</html>
