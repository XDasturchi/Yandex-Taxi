<%@ page import="com.example.employecarhomework.car.entity.Car" %>
<%@ page import="com.example.employecarhomework.car.entity.CarHistory" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>History | Yandex Taxi</title>
    <jsp:useBean id="carService" class="com.example.employecarhomework.car.CarService" scope="application"/>
</head>
<style>
    body {
        background: #0a41a6;
    }

    h1 {
        text-align: center;
    }

    h2 {
        margin-top: -10px;
        position: absolute;
        margin-left: 630px;
        cursor: pointer;
        padding: 10px;
        display: flex;
    }
</style>
<body>
<%
    Car car = carService.findById(request);
%>
<h2 onclick="back()">X</h2>
<h1><%=car.getName()%> | History</h1>
<% for (CarHistory carHistory : car.getCarHistoryList()) {%>
<div>
    <% if (carHistory.isReturn()) {%>
    <h3 style="color: greenyellow">Car returned in <%=carHistory.getEndTime()%> Employee -> <a
            href="../../templates/employe/employeeProfile.jsp?id=<%=carHistory.getUserId()%>">User</a></h3>
    <% } else {%>
    <h3 style="color: #ff0000">Car is not returned start time <%=carHistory.getStartTime()%>
        to <%=carHistory.getEndTime()%> <a
                href="../../templates/employe/employeeProfile.jsp?id=<%=carHistory.getUserId()%>"</h3>
    <%}%>
</div>
<%}%>
</body>

<script>

    function back() {
        var parent = window.parent.document;

        parent.getElementById("carHistory").className = "animate__animated animate__hinge";

        setTimeout(() => {
            parent.getElementById("carHistory").style.display = "none";
            parent.getElementById("car").style.display = "block";
            parent.getElementById("car").src = "templates/car/car.jsp";
            parent.getElementById("car").className = "animate__animated animate__rotateInDownLeft";
        }, 1000);


    }

</script>
</html>
