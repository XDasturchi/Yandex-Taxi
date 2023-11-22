<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Update</title>
    <jsp:useBean id="carService" class="com.example.employecarhomework.car.CarService" scope="application"/>
</head>
<body>
<%
    if (request.getMethod().equalsIgnoreCase("post")) {
        carService.update(request);
    }
%>
</body>
</html>
