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
        <p class="h1 text-center" style="font-family: 'Abril Fatface', cursive;">Czy napewno chcesz usunąć
            rejs ${param.name}?</p>
        <button onClick="location.href='delete?id=${param.id}'">OK</button>
        <button onClick="location.href='list'">Cancel</button>
</body>
</html>
