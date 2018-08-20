<%--
  Created by IntelliJ IDEA.
  User: korwi
  Date: 16.06.18
  Time: 16:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="input" uri="http://java.sun.com/jstl/sql" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>New cruise</title>
    <%@ include file="../jspf/head_config.jspf" %>
</head>
<body style="background-color: lightsteelblue">
        <%@ include file="../jspf/nav.jspf" %>
        <div class="d-inline-flex p-2 bd-highlight">
            <form:form modelAttribute="cruise" method="post">
                <form:hidden path="id"/>
                <div class="form-group">
                    <label for="exampleInputEmail1">Nazwa rejsu</label>
                    <form:input path="name" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp"
                                placeholder="Nazwa rejsu"/>
                    <small id="emailHelp" class="form-text text-danger"><form:errors path="name"/></small>
                </div>
                <div class="form-group">
                    <label for="exampleInputEmail1">Data rozpoczęcia</label>
                    <form:input path="start" type="date" class="form-control" id="exampleInputEmail1"
                                aria-describedby="emailHelp"/>
                    <small id="emailHelp" class="form-text text-danger"><form:errors path="start"/></small>
                </div>
                <div class="form-group">
                    <label for="exampleInputEmail1">Data zakończenia</label>
                    <form:input path="end" type="date" class="form-control" id="exampleInputEmail1"
                                aria-describedby="emailHelp"/>
                    <small id="emailHelp" class="form-text text-danger"><form:errors path="end"/></small>
                </div>
                <div class="form-group">
                    <label for="exampleInputEmail1">Nazwa jachtu</label>
                    <form:input path="yacht" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp"
                                placeholder="Nazwa jachtu"/>
                    <small id="emailHelp" class="form-text text-danger"><form:errors path="yacht"/></small>
                </div>
                <div class="form-group">
                    <label for="exampleInputEmail1">Maksymalna liczba użytkowników</label>
                    <form:input path="maxPpl" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp"
                                placeholder="Maksymalna liczba użytkowników<"/>
                    <small id="emailHelp" class="form-text text-danger"><form:errors path="maxPpl"/></small>
                </div>
                <div class="form-group">
                    <label for="exampleInputEmail1">Opis jachtu</label>
                    <form:textarea path="yachtDesc" class="form-control" id="exampleInputEmail1"
                                   aria-describedby="emailHelp"
                                   placeholder="Opis jachtu"/>
                </div>
                <button type="submit" class="btn btn-primary">Zatwierdź</button>
            </form:form>
        </div>
<%@ include file="../jspf/main_js.jspf" %>
</body>
</html>