<%@ page import="com.example.employecarhomework.employee.Employee" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<jsp:useBean id="employeService" class="com.example.employecarhomework.employee.EmployeeService" scope="application"/>
<head>
    <title>Employee | Yandex Taxi</title>
    <link rel="stylesheet" href="../../static/employe/index.css">
</head>
<body>
<h2 onclick="back()">X</h2>
<h1>Employees</h1>

<div class="createEmployee">
    <form action="create.jsp" method="post">
        <input type="text" name="name" id="name" placeholder="Name">
        <input type="text" name="surname" id="surname" placeholder="Surname">
        <input type="date" name="date" id="date">
        <button type="submit">Create</button>
    </form>
</div>

<div class="employeesTable">
    <table>
        <thead>
        <tr>
            <th>Id</th>
            <th>Name</th>
            <th>Surname</th>
            <th>BirthDay</th>
            <th>Action</th>
        </tr>
        </thead>
        <tbody>
        <% for (Employee employee : employeService.findAll()) { %>
        <tr>
            <td><%=employee.getId()%>
            </td>
            <td><%=employee.getName()%>
            </td>
            <td><%=employee.getSurname()%>
            </td>
            <td><%=employee.getBirthday()%>
            </td>
            <th class="action">
                <button class="delete"
                        onclick="onDelete('<%= (employee.getSurname()  + " " + employee.getName()) %>','<%=employee.getId()%>')">
                    Delete
                </button>
                <button onclick="onUpdate('<%=employee.getId()%>')" class="update">Update</button>
            </th>
        </tr>
        <% } %>
        </tbody>
    </table>
</div>
</body>

<script>
    function onDelete(fullName, id) {
        if (confirm("Are you delete " + fullName + "?")) {
            fetch(("delete.jsp?id=" + id), {
                method: "post",
                mode: "no-cors",
            });
            setTimeout(() => {
                window.location.reload();
            }, 100);
        }
    }

    function back() {
        var parent = window.parent.document;
        parent.getElementById("employee").className = "animate__animated animate__fadeOutDown";

        setTimeout(() => {
            parent.getElementById("employee").style.display = "none";
        }, 1000);
    }

    function onUpdate(id) {

        var parent = window.parent.document;
        parent.getElementById("employee").className = "animate__animated animate__backOutRight animate__slow	2s";

        setTimeout(() => {
            parent.getElementById("employee").style.display = "none";
        }, 2000);

        parent.getElementById("myEmployee").src = "templates/employe/employeeProfile.jsp?id=" + id;
        parent.getElementById("myEmployee").style.display = "block";
        parent.getElementById("myEmployee").className = "animate__animated animate__backInLeft animate__slow	2s";

    }
</script>
</html>
