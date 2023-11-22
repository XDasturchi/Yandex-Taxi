package com.example.employecarhomework.car.entity;

import jakarta.persistence.*;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;
import java.util.UUID;


@NoArgsConstructor
@Data
@Table(name = "`car`")
@Entity
public class Car {
    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    private UUID id;
    private String name;
    private String number;
    @Enumerated(EnumType.STRING)
    private CarType carType;
    @ManyToMany(fetch = FetchType.EAGER)
    @JoinTable(
            name = "car_history",
            joinColumns = @JoinColumn(name = "car_id"),
            inverseJoinColumns = @JoinColumn(name = "history_id")
    )
    private List<CarHistory> carHistoryList;

    public Car(String name, String number, CarType carType, List<CarHistory> carHistoryList) {
        this.name = name;
        this.number = number;
        this.carType = carType;
        this.carHistoryList = carHistoryList;
    }
}
