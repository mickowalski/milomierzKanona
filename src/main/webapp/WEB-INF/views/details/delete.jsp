<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Delete customer</title>
    <%@ include file="../jspf/head_config.jspf" %>
</head  style="background-color: lightsteelblue">
<body>
<%@ include file="../jspf/nav.jspf" %>
<h5>Czy na pewno chcesz usunąć użytkownika &nbsp; <c:out value="${param.fullName}"/>?</h5>
<button onClick="location.href='delete?id=${param.id}'">OK</button>
<button onClick="location.href='/details'">Cancel</button>
</html>
