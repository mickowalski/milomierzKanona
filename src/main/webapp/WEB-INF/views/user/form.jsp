<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Add/Edit User</title>
    <%@ include file="../jspf/head_config.jspf" %>
</head>
<body>

<%@ include file="../jspf/nav.jspf" %>
<div class="d-inline-flex p-2 bd-highlight">
    <form:form modelAttribute="editedUser" method="post" action="/user/edit">
        <form:hidden path="id"/>
    <div class="form-group">
        <label>Login</label>
        <form:input path="login" cssClass="form-control" placeholder="Login"/>
        <small class="form-text text-danger"><form:errors path="login"/></small>
    </div>
    <div class="form-group">
        <label>Email</label>
        <form:input path="email" cssClass="form-control" placeholder="Email"/>
        <small class="form-text text-danger"><form:errors path="email"/></small>
    </div>
    <div class="form-group">
        <label>Podaj hasło</label>
        <form:password path="password" cssClass="form-control" placeholder="Podaj hasło"/>
        <small class="form-text text-danger"><form:errors path="password"/></small>
    </div>
    <div class="form-group">
        <label>Powtórz hasło</label>
        <form:password path="confirmPass" cssClass="form-control" placeholder="Powtórz hasło"/>
    </div>
    <button type="submit" class="btn btn-primary">Zatwierdź</button>
    </form:form>
    <c:if test="${editedUser.id != null}">
    <button class="btn btn-primary"
            onclick="location.href='/user/delete?id=${editedUser.id}&login=${editedUser.login}'">Usuń
    </button>
    </c:if>
</body>
</html>
