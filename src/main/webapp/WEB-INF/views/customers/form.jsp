<%--
  Created by IntelliJ IDEA.
  User: korwi
  Date: 16.06.18
  Time: 17:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <%@ include file="../jspf/head_config.jspf" %>
    <title>Customer form</title>
</head>
<body>

<%@ include file="../jspf/nav.jspf" %>
<div class="d-inline-flex p-2 bd-highlight">
    <form:form modelAttribute="customer" method="post">
        <form:hidden path="id"/>
    <div class="form-group">
        <label>Imię</label>
        <form:input path="firstName" cssClass="form-control" placeholder="Imię"/>
        <small class="form-text text-danger"><form:errors path="firstName"/></small>
    </div>
    <div class="form-group">
        <label>Nazwisko</label>
        <form:input path="lastName" cssClass="form-control" placeholder="Nazwisko"/>
        <small class="form-text text-danger"><form:errors path="lastName"/></small>
    </div>
    <div class="form-group">
        <label>Ulica</label>
        <form:input path="street" cssClass="form-control" placeholder="Ulica"/>
    </div>
    <div class="form-group">
        <label>Kod pocztowy</label>
        <form:input path="zipCode" cssClass="form-control" placeholder="Kod pocztowy"/>
    </div>
    <div class="form-group">
        <label>Miejscowość</label>
        <form:input path="city" cssClass="form-control" placeholder="Miejscowość"/>
    </div>
    <div class="form-group">
        <label>Telefon</label>
        <form:input path="phone" cssClass="form-control" placeholder="Telefon"/>
    </div>
    <div class="form-group">
        <label> Emial</label>
        <form:input path="email" type="email" cssClass="form-control" placeholder="Email"/>
        <small class="form-text text-danger"><form:errors path="email"/></small>
    </div>
    <div class="form-group">
        <label>Pesel</label>
        <form:input path="pesel" cssClass="form-control" placeholder="Pesel"/>
    </div>
    <div class="form-group">
        <label>Rozmiar koszulki</label>
        <form:input path="shirt" cssClass="form-control" placeholder="Rozmiar koszulki"/>
    </div>
    <div class="form-group">
        <label>Zogada na otrzymywanie Email</label>
        <form:checkbox path="mailingList" cssClass="form-check-label"/>
    </div>
    <div class="form-group">
        <label>Zgoda na otrzzymywanie SMS</label>
        <form:checkbox path="smsAgreement" cssClass="form-check-label"/>
    </div>
    <button type="submit" class="btn btn-primary">Zatwierdź</button>
    </form:form>
    <%@ include file="../jspf/main_js.jspf" %>
</body>
</html>
