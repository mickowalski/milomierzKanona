<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Delete customer</title>
    <%@ include file="../jspf/head_config.jspf" %>
</head>
<body style="background-color: lightsteelblue">
<%@ include file="../jspf/nav.jspf" %>
<p class="h1 text-center" style="font-family: 'Abril Fatface', cursive;"> Czy na pewno chcesz usunąć
    klienta: ${param.firstName} ${param.lastName}?</p>
<button onClick="location.href='delete?id=${param.id}'">OK</button>
<button onClick="location.href='list'">Cancel</button>
</body>
</html>