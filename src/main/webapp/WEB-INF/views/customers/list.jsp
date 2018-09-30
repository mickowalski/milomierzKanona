<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>Customers</title>
    <%@ include file="../jspf/head_config.jspf" %>
</head>
<body>

<%@ include file="../jspf/nav.jspf" %>
<p class="h1 text-center" style="font-family: 'Tajawal', sans-serif;">Klienci</p>
<table class="table table-striped table-dark">
    <thead>
    <tr>
        <th scope="col">Imię</th>
        <th scope="col">Nazwisko</th>
        <th scope="col">Adres</th>
        <th scope="col">Telefon</th>
        <th scope="col">Email</th>
        <th scope="col">pesel</th>
        <th scope="col">koszulka</th>
        <th scope="col">action</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${customers}" var="customer">
        <tr>
            <td><c:out value="${customer.firstName}"/></td>
            <td><c:out value="${customer.lastName}"/></td>
            <td><c:out value="${customer.street}"/><br/>
                <c:out value="${customer.zipCode}"/> &nbsp; <c:out value="${customer.city}"/></td>
            <td><c:out value="${customer.phone}"/></td>
            <td><c:out value="${customer.email}"/></td>
            <td><c:out value="${customer.pesel}"/></td>
            <td><c:out value="${customer.shirt}"/></td>
            <td>
                <button class="btn btn-primary" onClick="location.href='/customers/form?id=${customer.id}'">Edytuj
                </button>
                <button class="btn btn-primary"
                        onclick="location.href='/customers/confirmDelete?id=${customer.id}&firstName=${customer.firstName}&lastName=${customer.lastName}'">
                    Usuń
                </button>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
<button type="button" onclick="location.href='/customers/form'" class="btn btn-primary">Dodaj nowego klienta
</button>
<%@ include file="../jspf/main_js.jspf" %>
</body>
</html>

