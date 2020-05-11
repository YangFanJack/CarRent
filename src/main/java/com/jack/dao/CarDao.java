package com.jack.dao;

import com.jack.pojo.Car;

import java.util.List;

public interface CarDao {
    int findTotalCount(Car car);
    List<Car> findCarByPage(int start, int ps, Car car);
    boolean addCar(Car car);
    boolean deleteCar(int id);
    boolean updateCar(Car car);
    Car findCarById(int id);
}
