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
<body>
        <%@ include file="../jspf/nav.jspf" %>
        <div class="d-inline-flex p-2 bd-highlight">
            <form:form modelAttribute="cruise" method="post" class="form-general">
                <form:hidden path="id"/>
                <div class="form-group">
                    <label>Nazwa rejsu</label>
                    <form:input path="name" cssClass="form-control" placeholder="Nazwa rejsu"/>
                    <small class="form-text text-danger"><form:errors path="name"/></small>
                </div>
                <div class="form-group">
                    <label>Data rozpoczęcia</label>
                    <form:input path="start" type="date" cssClass="form-control"/>
                    <small class="form-text text-danger"><form:errors path="start"/></small>
                </div>
                <div class="form-group">
                    <label>Data zakończenia</label>
                    <form:input path="end" type="date" cssClass="form-control"/>
                    <small class="form-text text-danger"><form:errors path="end"/></small>
                </div>
                <div class="form-group">
                    <label>Nazwa jachtu</label>
                    <form:input path="yacht" cssClass="form-control" placeholder="Nazwa jachtu"/>
                    <small class="form-text text-danger"><form:errors path="yacht"/></small>
                </div>
                <div class="form-group">
                    <label>Maksymalna liczba użytkowników</label>
                    <form:input path="maxPpl" cssClass="form-control" placeholder="Maksymalna liczba użytkowników<"/>
                    <small class="form-text text-danger"><form:errors path="maxPpl"/></small>
                </div>
                <div class="form-group">
                    <label>Opis jachtu</label>
                    <form:textarea path="yachtDesc" cssClass="form-control" placeholder="Opis jachtu"/>
                </div>
                <button type="submit" class="btn btn-primary">Zatwierdź</button>
            </form:form>
        </div>
<%@ include file="../jspf/main_js.jspf" %>
</body>
</html>