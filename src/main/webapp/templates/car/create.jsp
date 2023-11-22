<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="carService" class="com.example.employecarhomework.car.CarService" scope="application"/>
<html>
<head>
    <title>Car | Yandex Taxi</title>
</head>
<body>
<%
    if (request.getMethod().equalsIgnoreCase("post")) {
        carService.create(request);
    }
%>
</body>
</html>
