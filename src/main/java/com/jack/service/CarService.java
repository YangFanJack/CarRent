package com.jack.service;

import com.jack.pojo.Car;
import com.jack.pojo.PageBean;

public interface CarService {
    public boolean addCar(Car car);
    public PageBean<Car> findCarByPage(String currentPage, String pageSize, Car car);
    boolean deleteCar(int id);
    boolean updateCar(Car car);
    Car findCarById(int id);
}
