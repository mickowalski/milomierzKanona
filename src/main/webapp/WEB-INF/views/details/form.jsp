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
        <label for="exampleInputPassword1">Ilość mil</label>
        <form:input path="miles" class="form-control" id="exampleInputPassword1" placeholder="Dystans"/>
        <small id="emailHelp" class="form-text text-danger"><form:errors path="miles"/></small>
    </div>
    <div class="form-group">
        <label for="exampleInputEmail1">Cena rejsu</label>
        <form:input path="price" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp"
                    placeholder="Cena rejsu"/>
        <small id="emailHelp" class="form-text text-danger"><form:errors path="price"/></small>
    </div>
    <div class="form-group">
        <label for="exampleInputPassword1">Zapłacono</label>
        <form:input path="paid" class="form-control" id="exampleInputPassword1" placeholder="Zapłacono"/>
        <small id="emailHelp" class="form-text text-danger"><form:errors path="paid"/></small>
    </div>
    <div class="form-group">
        <label for="exampleInputEmail1">Uczestnik</label>
        <form:select items="${clients}" path="customer.id" itemValue="id" itemLabel="fullName" class="form-control"/>
    </div>
    <button type="submit" class="btn btn-primary">Zatwierdź</button>
    </form:form>
    <%@ include file="../jspf/main_js.jspf" %>
</body>
</html>

