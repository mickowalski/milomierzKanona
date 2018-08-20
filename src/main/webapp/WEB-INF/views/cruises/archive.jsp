<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Archive</title>
    <%@ include file="../jspf/head_config.jspf" %>
</head>
<body style="background-color: lightsteelblue">
        <%@ include file="../jspf/nav.jspf" %>
        <p class="h1 text-center" style="font-family: 'Tajawal', sans-serif;">Archiwum</p>
        <table class="table table-striped table-dark">
            <thead>
            <tr>
                <th scope="col">#</th>
                <th scope="col">Nazwa rejsu</th>
                <th scope="col">Data rozpoczęcia</th>
                <th scope="col">Data zakończenia</th>
                <th scope="col">Nazwa jachtu</th>
                <th scope="col">Opis jachtu</th>
                <th scope="col">Akcje</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${archive}" var="d" varStatus="stat">
                <tr>
                    <th scope="row"><c:out value="${stat.count}"/></th>
                    <td><c:out value="${d.name}"/></td>
                    <td><c:out value="${d.start}"/></td>
                    <td><c:out value="${d.end}"/></td>
                    <td><c:out value="${d.yacht}"/></td>
                    <td><c:out value="${d.yachtDesc}"/></td>
                    <td>
                        <button class="btn btn-primary"
                                onClick="javascript:location.href='/cruise/form?id=${d.id}&archive=${d.archive}'">Edytuj
                        </button>
                        <button class="btn btn-primary"
                                onclick="javascript:location.href='confirmDelete?id=${d.id}&name=${d.name}'">Usuń
                        </button>
                        <button class="btn btn-primary"
                                onClick="javascript:location.href='/details/list?cruiseId=${d.id}'">Szczegóły
                        </button>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
<%@ include file="../jspf/main_js.jspf" %>
</body>
</html>

</body>
</html>
