<%@ page import="com.example.employecarhomework.employee.Employee" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<jsp:useBean id="employeService" class="com.example.employecarhomework.employee.EmployeeService" scope="application"/>
<head>
    <title>Profile | Yandex Taxi</title>
    <link rel="stylesheet" href="../../static/employe/employeeUpdate.css">
</head>

<%
    Employee employee = employeService.findById(request);
%>
<body>
<% if (request.getMethod().equalsIgnoreCase("get")) { %>
<h2 onclick="back()">X</h2>
<h1><%=employee.getName()%> | Profile</h1>
<div class="updateTable">
    <input type="text" id="name" value="<%=employee.getName()%>" placeholder="Name">
    <input type="text" id="surname" value="<%=employee.getSurname()%>" placeholder="Surname">
    <input type="date" id="date" value="<%=employee.getBirthday()%>">
    <button onclick="onUpdate('<%=employee.getId()%>')">Update</button>
</div>
<%}%>
</body>
<script>
    function back() {
        var parent = window.parent.document;

        parent.getElementById("myEmployee").className = "animate__animated animate__fadeOutUpBig animate__slow	2s";

        setTimeout(() => {
            parent.getElementById("myEmployee").style.display = "none";
        }, 2000);

        parent.getElementById("employee").src = "templates/employe/index.jsp";
        parent.getElementById("employee").style.display = "block";
        parent.getElementById("employee").className = "animate__animated animate__fadeInUp animate__slow	2s";

    }

    function onUpdate(id) {
        let name = document.getElementById("name").value;
        let surname = document.getElementById("surname").value;
        let date = document.getElementById("date").value;

        var parent = window.parent.document;

        parent.getElementById("myEmployee").className = "animate__animated animate__rollOut"

        fetch(("http://localhost:8080/templates/employe/update.jsp?id=" + id + "&name=" + name + "&surname=" + surname + "&date=" + date), {
            method: "post",
            mode: "no-cors",
        });

        setTimeout(() => {
            parent.getElementById("myEmployee").src = "templates/employe/employeeProfile.jsp?id=" + id;
            parent.getElementById("myEmployee").className = "animate__animated animate__rollIn"
        }, 500);

    }
</script>
</html>
