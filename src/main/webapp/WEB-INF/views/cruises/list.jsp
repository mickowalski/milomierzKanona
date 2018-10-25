<%--
  Created by IntelliJ IDEA.
  User: korwi
  Date: 16.06.18
  Time: 15:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Cruise planner</title>
    <%@ include file="../jspf/head_config.jspf" %>
</head>
<body>
        <%@ include file="../jspf/nav.jspf" %>
        <p class="h1 text-center" style="font-family: 'Abril Fatface', cursive;"><i class="icon ion-ios-boat"></i>Rejsy
        </p>
        <table class="table table-striped table-dark">
            <thead>
            <tr>
                <th scope="col"></th>
                <th scope="col">Nazwa rejsu</th>
                <th scope="col">Data rozpoczęcia</th>
                <th scope="col">Data zakończenia</th>
                <th scope="col">Nazwa jachtu</th>
                <th scope="col">Opis jachtu</th>
                <th scope="col">Akcje</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${cruises}" var="cruise" varStatus="stat">
                <tr>
                    <th scope="row"><c:out value="${stat.count}"/></th>
                    <td><c:out value="${cruise.name}"/></td>
                    <td><c:out value="${cruise.start}"/></td>
                    <td><c:out value="${cruise.end}"/></td>
                    <td><c:out value="${cruise.yacht}"/></td>
                    <td><c:out value="${cruise.yachtDesc}"/></td>
                    <td>
                        <button class="btn btn-primary" onClick="location.href='/cruises/form?id=${cruise.id}'">Edytuj
                        </button>
                        <button class="btn btn-primary" onClick="location.href='/cruises/toArchive?id=${cruise.id}'">
                            Archiwizuj
                        </button>
                        <button class="btn btn-primary"
                                onclick="location.href='/cruises/confirmDelete?id=${cruise.id}&name=${cruise.name}'">
                            Usuń
                        </button>
                        <button class="btn btn-primary"
                                onClick="location.href='/details?cruiseId=${cruise.id}'">Szczegóły
                        </button>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
        <p>
            <button class="btn btn-primary" onClick="location.href='/cruises/form'">Dodaj rejs</button>
        </p>
<%@ include file="../jspf/main_js.jspf" %>
</body>
</html>
