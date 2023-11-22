package com.example.employecarhomework;

import com.example.employecarhomework.car.CarDao;
import com.example.employecarhomework.car.entity.Car;
import com.example.employecarhomework.car.entity.CarHistory;
import com.example.employecarhomework.car.entity.CarType;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "main", value = "/main")
public class Main extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        CarDao carDao = CarDao.getInstance();
        carDao.create(new Car("Mers", "ss", CarType.MOTORCYCLE, new ArrayList<>()));
    }
}
