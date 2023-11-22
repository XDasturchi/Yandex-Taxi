package com.example.employecarhomework.car;

import com.example.employecarhomework.car.entity.Car;
import com.example.employecarhomework.car.entity.CarHistory;
import com.example.employecarhomework.car.entity.CarType;
import jakarta.servlet.http.HttpServletRequest;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;

public class CarService {
    private final ScheduledExecutorService scheduledExecutorService = Executors.newScheduledThreadPool(10);
    private final CarDao carDao = CarDao.getInstance();

    public void create(HttpServletRequest request) {
        String name = request.getParameter("name");
        String number = request.getParameter("number");
        CarType type = CarType.valueOf(request.getParameter("type"));
        Car car = new Car(name, number, type, new ArrayList<>());
        carDao.create(car);
    }

    public void giveCar(HttpServletRequest request) {
        try {
            UUID carId = UUID.fromString(request.getParameter("car_id"));
            UUID userId = UUID.fromString(request.getParameter("user_id"));
            String replace = request.getParameter("end_time").replace("T", " ");
            LocalDateTime endTime = LocalDateTime.parse(replace, DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm"));
            CarHistory carHistory = new CarHistory(userId, carId, LocalDateTime.now(), endTime);
            carDao.addHistory(carHistory);
            scheduledExecutorService.schedule(() -> carHistory.setReturn(true), getDuration(LocalDateTime.now(), endTime), TimeUnit.SECONDS);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    public void update(HttpServletRequest request) {
        UUID id = UUID.fromString(request.getParameter("id"));
        String name = request.getParameter("name");
        String number = request.getParameter("number");
        CarType type = CarType.valueOf(request.getParameter("type"));
        carDao.update(id, new Car(name, number, type, new ArrayList<>()));
    }

    public void delete(HttpServletRequest request) {
        UUID id = UUID.fromString(request.getParameter("id"));
        carDao.delete(id);
    }

    public Car findById(HttpServletRequest request) {
        UUID id = UUID.fromString(request.getParameter("id"));
        return carDao.findById(id);
    }

    public List<Car> findAll() {
        return carDao.findAll();
    }

    private long getDuration(LocalDateTime from, LocalDateTime to) {
        int second = 0;
        while (from.getHour() != to.getHour() && from.getMinute() != to.getMinute() && from.getSecond() != to.getSecond()) {
            from = from.plusSeconds(1);
            second++;
        }

        return second;
    }
}
