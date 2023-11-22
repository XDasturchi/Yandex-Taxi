package com.example.employecarhomework.employee;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.EntityTransaction;
import jakarta.persistence.Persistence;
import lombok.AccessLevel;
import lombok.NoArgsConstructor;

import java.util.List;
import java.util.UUID;

@NoArgsConstructor(access = AccessLevel.PRIVATE)
public class EmployeeDao {
    private final static EmployeeDao employeeDao = new EmployeeDao();

    public void create(Employee employee) {
        try (EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("yandex_taxi")) {
            EntityManager entityManager = entityManagerFactory.createEntityManager();
            EntityTransaction transaction = entityManager.getTransaction();
            transaction.begin();
            entityManager.persist(employee);
            transaction.commit();
        }
    }

    public void delete(UUID employeeId) {
        try (EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("yandex_taxi")) {
            EntityManager entityManager = entityManagerFactory.createEntityManager();
            EntityTransaction transaction = entityManager.getTransaction();
            transaction.begin();
            Employee employee = entityManager.find(Employee.class, employeeId);
            entityManager.remove(employee);
            transaction.commit();
        }
    }

    public void update(UUID employeeId, Employee employee) {
        try (EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("yandex_taxi")) {
            EntityManager entityManager = entityManagerFactory.createEntityManager();
            EntityTransaction transaction = entityManager.getTransaction();
            transaction.begin();
            Employee newEmployee = entityManager.find(Employee.class, employeeId);
            newEmployee.setName(employee.getName());
            newEmployee.setSurname(employee.getSurname());
            newEmployee.setBirthday(employee.getBirthday());
            transaction.commit();
        }
    }

    public Employee findById(UUID id) {
        try (EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("yandex_taxi")) {
            EntityManager entityManager = entityManagerFactory.createEntityManager();
            EntityTransaction transaction = entityManager.getTransaction();
            transaction.begin();
            Employee newEmployee = entityManager.find(Employee.class, id);
            transaction.commit();
            return newEmployee;
        }
    }

    public List<Employee> findAll() {
        try (EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("yandex_taxi")) {
            EntityManager entityManager = entityManagerFactory.createEntityManager();
            EntityTransaction transaction = entityManager.getTransaction();
            transaction.begin();
            List<Employee> selectEmpFromEmployeeEmp = entityManager.createQuery("select emp from Employee emp", Employee.class).getResultList();
            transaction.commit();
            return selectEmpFromEmployeeEmp;
        }
    }

    public static EmployeeDao getInstance() {
        return employeeDao;
    }
}
