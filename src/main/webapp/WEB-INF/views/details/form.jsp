<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Cruise details</title>
    <%@ include file="../jspf/head_config.jspf" %>
</head>
<body>
<%@ include file="../jspf/nav.jspf" %>
<div class="d-inline-flex p-2 bd-highlight">
    <form:form modelAttribute="details" method="post">
        <form:hidden path="id"/>
        <form:hidden path="curPpl"/>
        <form:hidden path="cruise.id"/>
    <div class="form-group">
        <label>Ilość mil</label>
        <form:input path="miles" cssClass="form-control" placeholder="Dystans"/>
        <small class="form-text text-danger"><form:errors path="miles"/></small>
    </div>
    <div class="form-group">
        <label>Cena rejsu</label>
        <form:input path="price" cssClass="form-control" placeholder="Cena rejsu"/>
        <small class="form-text text-danger"><form:errors path="price"/></small>
    </div>
    <div class="form-group">
        <label>Zapłacono</label>
        <form:input path="paid" cssClass="form-control" placeholder="Zapłacono"/>
        <small class="form-text text-danger"><form:errors path="paid"/></small>
    </div>
    <div class="form-group">
        <label>Uczestnik</label>
        <form:select items="${clients}" path="customer.id" itemValue="id" itemLabel="fullName" cssClass="form-control"/>
    </div>
    <button type="submit" class="btn btn-primary">Zatwierdź</button>
    </form:form>
    <%@ include file="../jspf/main_js.jspf" %>
</body>
</html>

