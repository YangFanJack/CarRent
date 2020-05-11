package com.jack.service.impl;

import com.jack.dao.InitDao;
import com.jack.dao.impl.InitDaoImpl;
import com.jack.pojo.Car;
import com.jack.pojo.Rent;
import com.jack.service.InitService;

import java.util.ArrayList;
import java.util.List;

public class InitServiceImpl implements InitService {

    private InitDao initDao = new InitDaoImpl();

    public void setInitDao(InitDao initDao) {
        this.initDao = initDao;
    }

    @Override
    public List findInit() {
        List<Car> carList = initDao.findInitCar();
        List<Rent> rentList = initDao.findInitRent();
        List allInit = new ArrayList();
        if (carList.size()>0){
            allInit.add(carList);
        }
        if (rentList.size()>0){
            allInit.add(rentList);
        }
        return allInit;
    }
}
