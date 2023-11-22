<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<jsp:useBean id="employeService" class="com.example.employecarhomework.employee.EmployeeService" scope="application"/>
<head>
    <title>Profile | Yandex Taxi</title>
</head>
<body>
<%
    if(request.getMethod().equalsIgnoreCase("post")){
        employeService.update(request);
        System.out.println("S");
    }
%>
</body>
</html>
