<%@ page import="com.example.employecarhomework.car.entity.Car" %>
<%@ page import="com.example.employecarhomework.employee.Employee" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<jsp:useBean id="carService" class="com.example.employecarhomework.car.CarService" scope="application"/>
<jsp:useBean id="employeService" class="com.example.employecarhomework.employee.EmployeeService" scope="application"/>
<head>
    <title>Car | Yandex Taxi</title>
    <link rel="stylesheet" href="../../static/car/car.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>
</head>
<body>
<h2 onclick="back()">X</h2>
<h1>Cars</h1>
<div class="createCar">
    <input type="text" placeholder="Car Name" id="carName">
    <input type="text" placeholder="Car Number" id="carNumber">
    <select id="carType">
        <option value="TRUCK">Truck</option>
        <option value="CAR">Car</option>
        <option value="MOTORCYCLE">Motor-Cycle</option>
    </select>
    <button onclick="onCreate()">Create</button>
</div>
<div class="createCarHistory">
    <select id="user_id">
        <% for (Employee employee : employeService.findAll()) {%>
        <option value="<%=employee.getId()%>"><%=employee.getName() + " " + employee.getSurname()%>
        </option>
        <% } %>
    </select>
    <select id="car_id">
        <% for (Car car : carService.findAll()) {%>
        <% if (car.getCarHistoryList().size() > 0) {%>
        <% if (!car.getCarHistoryList().get(car.getCarHistoryList().size() - 1).isReturn()) { %>
        <option value="<%=car.getId()%>"><%=car.getName() + " | " + car.getNumber()%>
        </option>
        <% } %>
        <% } else { %>
        <option value="<%=car.getId()%>"><%=car.getName() + " | " + car.getNumber()%>
                <% } %>
                <% } %>
    </select>
    <input type="datetime-local" id="end_time">
    <button onclick="giveCar()">Give Car</button>
</div>

<table>
    <thead>
    <th>Id</th>
    <th>Name</th>
    <th>Number</th>
    <th>Car Type</th>
    <th>Action</th>
    </thead>

    <tbody>
    <% for (Car car : carService.findAll()) {%>
    <tr>
        <td><%=car.getId().toString().substring(0, 8)%>...</td>
        <td><%=car.getName()%>
        </td>
        <td><%=car.getNumber()%>
        </td>
        <td><%=car.getCarType()%>
        </td>
        <th>
            <button id="delete" onclick="onDelete('<%=car.getId()%>', '<%=car.getName() + " | " + car.getNumber()%>')">
                Delete
            </button>
            <button id="update" onclick="onUpdate('<%=car.getId()%>')">Update</button>
            <button id="history" onclick="onHistory('<%=car.getId()%>')">History</button>
        </th>
    </tr>
    <%} %>
    <tr>

    </tr>
    </tbody>
</table>

</body>

<script>
    function onCreate() {
        let carName = document.getElementById("carName").value;
        let carNumber = document.getElementById("carNumber").value;
        let carType = document.getElementById("carType").value;

        var parent = window.parent.document;

        fetch(("http://localhost:8080/templates/car/create.jsp?name=" + carName + "&number=" + carNumber + "&type=" + carType), {
            method: "post",
            mode: "no-cors",
        });

        parent.getElementById("car").className = "animate__animated animate__bounceOut"

        setTimeout(() => {
            parent.getElementById("car").style.display = "none";
            parent.getElementById("car").style.display = "block";
            parent.getElementById("car").src = "templates/car/car.jsp";
            parent.getElementById("car").className = "animate__animated animate__rollIn"
        }, 500);
    }

    function onDelete(id, name) {

        if (confirm("Are you delete " + name + " car?")) {

            var parent = window.parent.document;

            fetch(("http://localhost:8080/templates/car/delete.jsp?id=" + id), {
                method: "post",
                mode: "no-cors",
            });

            setTimeout(() => {
                parent.getElementById("car").src = parent.getElementById("car").src;
            }, 100);

        }
    }

    function back() {
        var parent = window.parent.document;

        parent.getElementById("car").className = "animate__animated animate__rotateOut";

        setTimeout(() => {
            parent.getElementById("car").style.display = "none";
        }, 500);

    }

    function onUpdate(id) {
        var parent = window.parent.document;

        parent.getElementById("car").className = "animate__animated animate__rotateOutDownLeft";

        setTimeout(() => {
            parent.getElementById("car").style.display = "none";
            parent.getElementById("myCar").style.display = "block";
            parent.getElementById("myCar").src = "templates/car/update.jsp?id=" + id;
            parent.getElementById("myCar").className = "animate__animated animate__rotateInDownLeft";
        }, 300);


    }

    function onHistory(id) {
        var parent = window.parent.document;

        parent.getElementById("car").className = "animate__animated animate__rotateOutDownRight";

        setTimeout(() => {
            parent.getElementById("car").style.display = "none";
            parent.getElementById("carHistory").style.display = "block";
            parent.getElementById("carHistory").src = "templates/car/history.jsp?id=" + id;
            parent.getElementById("carHistory").className = "animate__animated animate__jackInTheBox";
        }, 500);
    }

    function giveCar() {
        let carId = document.getElementById("car_id").value;
        let userId = document.getElementById("user_id").value;
        let endDate = document.getElementById("end_time").value;

        fetch(("http://localhost:8080/templates/car/addCarHistory.jsp?car_id=" + carId + "&user_id=" + userId + "&end_time=" + endDate), {
            method: "post",
            mode: "no-cors",
        });

        alert("Created!");

        setTimeout(() => {
            parent.getElementById("car").src = parent.getElementById("car").src;
        }, 100);
    }
</script>
</html>