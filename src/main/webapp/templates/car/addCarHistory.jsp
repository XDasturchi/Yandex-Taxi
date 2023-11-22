<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add Car | Yandex Taxi</title>
    <jsp:useBean id="carService" class="com.example.employecarhomework.car.CarService" scope="application"/>
</head>
<body>
<%
    if (request.getMethod().equalsIgnoreCase("post")) {
        carService.giveCar(request);
    }
%>

</body>
</html>
