package com.jack.dao;

import com.jack.pojo.Rent;

import java.util.List;

public interface RentDao {
    boolean addRent(Rent rent);
    boolean updateRent(Rent rent);
    int findTotalCount(Rent rent);
    List<Rent> findCarByPage(int start, int ps, Rent rent);
    boolean deleteRent(int id);
    Rent findRentById(int id);
}
