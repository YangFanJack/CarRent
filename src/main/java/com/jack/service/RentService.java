package com.jack.service;

import com.jack.pojo.PageBean;
import com.jack.pojo.Rent;

public interface RentService {
    boolean addRent(Rent rent);
    boolean updateRent(Rent rent);
    PageBean<Rent> findRentByPage(String currentPage, String pageSize, Rent rent);
    boolean deleteRent(int id);
    Rent findRentById(int id);
}
