package com.jack.dao;

import com.jack.pojo.Car;
import com.jack.pojo.Rent;

import java.util.List;

public interface InitDao {
    List<Car> findInitCar();

    List<Rent> findInitRent();
}
