<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<jsp:useBean id="carService" class="com.example.employecarhomework.car.CarService" scope="application"/>
<%
    if (request.getMethod().equalsIgnoreCase("post")) {
        carService.delete(request);
    }
%>
</body>
</html>
