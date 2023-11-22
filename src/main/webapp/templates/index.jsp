<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Yandex Taxi | App</title>
    <link rel="stylesheet" href="../static/style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>
</head>
<body>

<h1 class="animate__animated animate__backInUp animate__slow	6s"><img
        class="animate__animated animate__heartBeat animate__infinite	infinite animate__slow	30  s"
        src="resources/car.png"> Yandex Taxi
</h1>
<div class="main">
    <button onclick="employeeOn()" class="animate__animated animate__backInLeft animate__slow	3s">
        <div><img class="animate__animated animate__heartBeat animate__backInRight animate__slow	10s"
                  src="resources/employee.png">
            <h2>Employee</h2>
        </div>
    </button>

    <button onclick="onCar()" class="animate__animated animate__backInLeft animate__backInRight animate__slow	2s">
        <div><img class="animate__animated animate__heartBeat animate__backInRight animate__slow	10s"
                  src="resources/employeeCar.png">
            <h2 style="margin-left: 15px">Car</h2>
        </div>
    </button>

</div>

<div>
    <iframe name="myEmployee" class="animate__animated animate__backInLeft" id="myEmployee" width="700"
            height="440" src="">
    </iframe>
</div>


<div>
    <iframe name="employee" class="" id="employee" width="700"
            height="440" src="templates/employe/index.jsp">
    </iframe>
</div>

<div>
    <iframe name="car" class="" id="car" width="800"
            height="440" src="templates/car/car.jsp">
    </iframe>
</div>

<div>
    <iframe name="myCar" class="" id="myCar" width="700"
            height="440" src="">
    </iframe>
</div>

<div>
    <iframe name="carHistory" class="" id="carHistory" width="700"
            height="440" src="">
    </iframe>
</div>

</body>

<script>
    function employeeOn() {
        document.getElementById("employee").style.display = "block";
        document.getElementById("employee").className = "animate__animated  animate__fadeInUp";
    }

    function onCar() {
        document.getElementById("car").style.display = "block";
        document.getElementById("car").className = "animate__animated  animate__flipInX";
    }
</script>
</html>
