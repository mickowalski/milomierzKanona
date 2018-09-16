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
<body style="background-color: lightsteelblue">

<%@ include file="../jspf/nav.jspf" %>
<div class="d-inline-flex p-2 bd-highlight">
    <form:form modelAttribute="customer" method="post">
        <form:hidden path="id"/>
    <div class="form-group">
        <label for="exampleInputPassword1">Imię</label>
        <form:input path="firstName" class="form-control" id="exampleInputPassword1" placeholder="Imię"/>
        <small id="emailHelp" class="form-text text-danger"><form:errors path="firstName"/></small>
    </div>
    <div class="form-group">
        <label for="exampleInputEmail1">Nazwisko</label>
        <form:input path="lastName" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp"
                    placeholder="Nazwisko"/>
        <small id="emailHelp" class="form-text text-danger"><form:errors path="lastName"/></small>
    </div>
    <div class="form-group">
        <label for="exampleInputPassword1">Ulica</label>
        <form:input path="street" class="form-control" id="exampleInputPassword1" placeholder="Ulica"/>
    </div>
    <div class="form-group">
        <label for="exampleInputPassword1">Kod pocztowy</label>
        <form:input path="zipCode" cssClass="form-control" id="exampleInputPassword1" placeholder="Kod pocztowy"/>
    </div>
    <div class="form-group">
        <label for="exampleInputEmail1">Miejscowość</label>
        <form:input path="city" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp"
                    placeholder="Miejscowość"/>
    </div>
    <div class="form-group">
        <label for="exampleInputPassword1">Telefon</label>
        <form:input path="phone" class="form-control" id="exampleInputPassword1" placeholder="Telefon"/>
    </div>
    <div class="form-group">
        <label for="exampleInputPassword1"> Emial</label>
        <form:input path="email" type="email" class="form-control" id="exampleInputPassword1" placeholder="Email"/>
        <small id="emailHelp" class="form-text text-danger"><form:errors path="email"/></small>
    </div>
    <div class="form-group">
        <label for="exampleInputEmail1">Pesel</label>
        <form:input path="pesel" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp"
                    placeholder="Pesel"/>
    </div>
    <div class="form-group">
        <label for="exampleInputPassword1">Rozmiar koszulki</label>
        <form:input path="shirt" class="form-control" id="exampleInputPassword1" placeholder="Rozmiar koszulki"/>
    </div>
    <button type="submit" class="btn btn-primary">Zatwierdź</button>
    </form:form>
    <%@ include file="../jspf/main_js.jspf" %>
</body>
</html>
