package com.example.employecarhomework.employee;


import jakarta.servlet.http.HttpServletRequest;

import java.time.LocalDate;
import java.util.List;
import java.util.UUID;

public class EmployeeService {

    private final EmployeeDao employeeDao = EmployeeDao.getInstance();


    public void create(HttpServletRequest httpServletRequest) {
        String name = httpServletRequest.getParameter("name");
        String surname = httpServletRequest.getParameter("surname");
        LocalDate birthDay = LocalDate.parse(httpServletRequest.getParameter("date"));
        employeeDao.create(new Employee(name, surname, birthDay));
    }

    public void update(HttpServletRequest httpServletRequest) {
        UUID id = UUID.fromString(httpServletRequest.getParameter("id"));
        String name = httpServletRequest.getParameter("name");
        String surname = httpServletRequest.getParameter("surname");
        LocalDate birthDay = LocalDate.parse(httpServletRequest.getParameter("date"));
        employeeDao.update(id, new Employee(name, surname, birthDay));
    }

    public void delete(HttpServletRequest httpServletRequest) {
        UUID id = UUID.fromString(httpServletRequest.getParameter("id"));
        employeeDao.delete(id);
    }

    public List<Employee> findAll() {
        return employeeDao.findAll();
    }

    public Employee findById(HttpServletRequest request) {
        UUID id = UUID.fromString(request.getParameter("id"));
        return employeeDao.findById(id);
    }
}
