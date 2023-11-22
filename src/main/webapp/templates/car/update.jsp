<%@ page import="com.example.employecarhomework.car.entity.Car" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<jsp:useBean id="carService" class="com.example.employecarhomework.car.CarService" scope="application"/>
<head>
    <title>Update Car | Yandex Id</title>
</head>

<style>
    body {
        background-color: #1baa00;
    }

    .updateCar {
        margin-left: auto;
        margin-right: auto;
        display: grid;
        width: 300px;
        text-align: center;
    }

    .updateCar input {
        margin-top: 15px;
        padding: 3px;
        text-align: center;
        border: 1px solid black;
        border-radius: 10px;
        font-weight: bold;
        background: #06ffba;
    }

    .updateCar input::placeholder {
        color: black;
    }

    .updateCar select {
        margin-top: 15px;
        padding: 3px;
        text-align: center;
        border: 1px solid black;
        border-radius: 10px;
        font-weight: bold;
        background: #06ffba;
    }

    .updateCar button {
        width: 60%;
        margin-left: auto;
        margin-right: auto;
        margin-top: 15px;
        padding: 3px;
        text-align: center;
        border: 1px solid black;
        border-radius: 10px;
        font-weight: bold;
        background: #18ff27;
    }

    h1 {
        text-align: center;
    }
</style>

<body>

<% Car car = carService.findById(request); %>
<h1><%=car.getName()%> | Profile</h1>
<div class="updateCar">
    <input type="text" placeholder="Car Name" id="carName" value="<%=car.getName()%>">
    <input type="text" placeholder="Car Number" id="carNumber" value="<%=car.getNumber()%>">
    <select id="carType" value="<%=car.getCarType()%>">
        <option value="TRUCK">Truck</option>
        <option value="CAR">Car</option>
        <option value="MOTORCYCLE">Motor-Cycle</option>
    </select>
    <button onclick="onUpdate('<%=car.getId()%>')">Update</button>
</div>
</body>
<script>
    function onUpdate(id) {
        let name = document.getElementById("carName").value;
        let carNumber = document.getElementById("carNumber").value;
        let type = document.getElementById("carType").value;

        var parent = window.parent.document;

        parent.getElementById("myCar").className = "animate__animated animate__slideOutDown";

        fetch(("http://localhost:8080/templates/car/carUpdate.jsp?id=" + id + "&name=" + name + "&number=" + carNumber + "&type=" + type), {
            method: "post",
            mode: "no-cors",
        });

        setTimeout(() => {
            parent.getElementById("myCar").style.display = "none";
            parent.getElementById("car").style.display = "block";
            parent.getElementById("car").src = parent.getElementById("car").src
            parent.getElementById("car").className = "animate__animated animate__rotateInUpLeft";
        }, 300);
    }
</script>
</html>
