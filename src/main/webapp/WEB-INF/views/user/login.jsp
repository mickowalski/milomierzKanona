<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Login</title>
    <%@ include file="../jspf/head_config.jspf" %>
</head>
<body>
<%@ include file="../jspf/empty_nav.jspf" %>
<p class="h1 text-center" style="font-family: 'Tajawal', sans-serif;">Login</p>

<div class="d-inline-flex p-2 bd-highlight">
    <small class="form-text text-danger"><c:out value="${loginError}"/></small>
    \n
    <form:form modelAttribute="user" method="post">
        <form:hidden path="id"/>
    <div class="form-group">
        <label>email</label>
        <form:input path="email" cssClass="form-control" placeholder="Email"/>
    </div>
    <div class="form-group">
        <label>Hasło</label>
        <form:password path="password" cssClass="form-control" placeholder="Hasło"/>
    </div>
    <button type="submit" class="btn btn-primary">Zaloguj</button>
    </form:form>

</body>
</html>
