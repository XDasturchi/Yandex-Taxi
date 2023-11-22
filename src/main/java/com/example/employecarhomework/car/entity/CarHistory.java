package com.example.employecarhomework.car.entity;

import jakarta.persistence.*;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;
import java.util.List;
import java.util.UUID;

@NoArgsConstructor
@Data
@Entity
@Table(name = "history_of_car")
public class CarHistory {
    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    private UUID id;
    private UUID carId;
    private UUID userId;
    private boolean isReturn;
    private LocalDateTime startTime;
    private LocalDateTime endTime;
    @ManyToMany(mappedBy = "carHistoryList", fetch = FetchType.EAGER)
    private List<Car> carList;

    public CarHistory(UUID userId, UUID carId, LocalDateTime startTime, LocalDateTime endTime) {
        this.id = UUID.randomUUID();
        this.userId = userId;
        this.carId = carId;
        this.startTime = startTime;
        this.endTime = endTime;
    }
}
