<%@ page import="java.io.PrintWriter" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<jsp:useBean id="employeService" class="com.example.employecarhomework.employee.EmployeeService" scope="application"/>
<head>
    <title>Employee | Yandex Taxi</title>
</head>
<body>
<%

    if (request.getMethod().equalsIgnoreCase("post")) {
        employeService.create(request);
    }

    response.sendRedirect("index.jsp");
%>
</body>
</html>
