package com.example.employecarhomework.car;

import com.example.employecarhomework.car.entity.Car;
import com.example.employecarhomework.car.entity.CarHistory;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.EntityTransaction;
import jakarta.persistence.Persistence;
import lombok.AccessLevel;
import lombok.NoArgsConstructor;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

@NoArgsConstructor(access = AccessLevel.PRIVATE)
public class CarDao {
    private final static CarDao carDao = new CarDao();

    public void create(Car car) {
        try (EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("yandex_taxi")) {
            EntityManager entityManager = entityManagerFactory.createEntityManager();
            EntityTransaction transaction = entityManager.getTransaction();
            transaction.begin();
            entityManager.persist(car);
            transaction.commit();
        }
    }

    public void delete(UUID id) {
        try (EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("yandex_taxi")) {
            EntityManager entityManager = entityManagerFactory.createEntityManager();
            EntityTransaction transaction = entityManager.getTransaction();
            transaction.begin();
            Car car = entityManager.find(Car.class, id);
            entityManager.remove(car);
            transaction.commit();
        }
    }

    public void update(UUID carId, Car car) {
        try (EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("yandex_taxi")) {
            EntityManager entityManager = entityManagerFactory.createEntityManager();
            EntityTransaction transaction = entityManager.getTransaction();
            transaction.begin();
            Car newCar = entityManager.find(Car.class, carId);
            newCar.setName(car.getName());
            newCar.setNumber(car.getNumber());
            newCar.setCarType(car.getCarType());
            transaction.commit();
        }
    }

    public Car findById(UUID id) {
        try (EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("yandex_taxi")) {
            EntityManager entityManager = entityManagerFactory.createEntityManager();
            EntityTransaction transaction = entityManager.getTransaction();
            transaction.begin();
            Car car = entityManager.find(Car.class, id);
            transaction.commit();
            return car;
        }
    }

    public List<Car> findAll() {
        try (EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("yandex_taxi")) {
            List<Car> carList = new ArrayList<>();
            EntityManager entityManager = entityManagerFactory.createEntityManager();
            EntityTransaction transaction = entityManager.getTransaction();
            transaction.begin();
            carList = entityManager
                    .createQuery("select emp from Car emp", Car.class)
                    .getResultList();
            transaction.commit();
            return carList;
        }
    }

    public void addHistory(CarHistory carHistory) {
        try (EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("yandex_taxi")) {
            EntityManager entityManager = entityManagerFactory.createEntityManager();
            EntityTransaction transaction = entityManager.getTransaction();
            transaction.begin();
            Car car = entityManager.find(Car.class, carHistory.getCarId());
            car.getCarHistoryList().add(carHistory);
            transaction.commit();
        }
    }

    public static CarDao getInstance() {
        return carDao;
    }
}
