package com.jack.service.impl;

import com.jack.dao.CarDao;
import com.jack.dao.impl.CarDaoImpl;
import com.jack.pojo.Car;
import com.jack.pojo.PageBean;
import com.jack.service.CarService;

import java.util.List;

public class CarServiceImpl implements CarService {
    private CarDao carDao = new CarDaoImpl();

    public void setCarDao(CarDao carDao) {
        this.carDao = carDao;
    }

    @Override
    public boolean addCar(Car car) {
        return carDao.addCar(car);
    }

    @Override
    public PageBean<Car> findCarByPage(String currentPage, String pageSize, Car car) {
        int cp = Integer.parseInt(currentPage);
        int ps = Integer.parseInt(pageSize);

        //创建新的pageBean对象
        PageBean<Car> pageBean = new PageBean<>();
        //设置参数
        pageBean.setCurrentPage(cp);
        pageBean.setPageSize(ps);

        //调用dao查询总记录数
        int totalCount = carDao.findTotalCount(car);
        pageBean.setTotalCount(totalCount);

        //调用dao查询list集合
        //计算开始的索引
        int start = (cp-1)*ps;
        List<Car> carList = carDao.findCarByPage(start,ps,car);
        pageBean.setList(carList);

        //设置总页码
        int totalPage = (totalCount % ps ) == 0 ? totalCount/ps : (totalCount/ps)+1;
        pageBean.setTotalPage(totalPage);

        return pageBean;
    }

    @Override
    public boolean deleteCar(int id) {
        return carDao.deleteCar(id);
    }

    @Override
    public boolean updateCar(Car car) {
        return carDao.updateCar(car);
    }

    @Override
    public Car findCarById(int id) {
        return carDao.findCarById(id);
    }
}
