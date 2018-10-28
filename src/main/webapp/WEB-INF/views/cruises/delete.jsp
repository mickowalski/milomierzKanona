<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Delete cruise</title>
    <%@ include file="../jspf/head_config.jspf" %>
</head>
<body>
        <%@ include file="../jspf/nav.jspf" %>
        <p class="h1 text-center delete-trip" style="font-family: 'Abril Fatface', cursive;">Czy na pewno chcesz usunąć
            rejs <span class="cruise-name">${param.name}?</span></p>
        <button class="delete-trip-btn" onClick="location.href='delete?id=${param.id}'">OK</button>
        <button class="delete-trip-btn" onClick="location.href='list'">Cancel</button>
</body>
</html>
