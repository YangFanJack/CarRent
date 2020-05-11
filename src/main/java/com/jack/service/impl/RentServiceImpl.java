package com.jack.service.impl;

import com.jack.dao.RentDao;
import com.jack.dao.impl.RentDaoImpl;
import com.jack.pojo.PageBean;
import com.jack.pojo.Rent;
import com.jack.service.RentService;

import java.util.List;

public class RentServiceImpl implements RentService {
    private RentDao rentDao = new RentDaoImpl();

    public void setRentDao(RentDao rentDao) {
        this.rentDao = rentDao;
    }

    @Override
    public boolean addRent(Rent rent) {
        return rentDao.addRent(rent);
    }

    @Override
    public boolean updateRent(Rent rent) {
        return rentDao.updateRent(rent);
    }

    @Override
    public PageBean<Rent> findRentByPage(String currentPage, String pageSize, Rent rent) {
        int cp = Integer.parseInt(currentPage);
        int ps = Integer.parseInt(pageSize);

        //创建新的pageBean对象
        PageBean<Rent> pageBean = new PageBean<>();
        //设置参数
        pageBean.setCurrentPage(cp);
        pageBean.setPageSize(ps);

        //调用dao查询总记录数
        int totalCount = rentDao.findTotalCount(rent);
        pageBean.setTotalCount(totalCount);

        //调用dao查询list集合
        //计算开始的索引
        int start = (cp-1)*ps;
        List<Rent> rentList = rentDao.findCarByPage(start,ps,rent);
        pageBean.setList(rentList);

        //设置总页码
        int totalPage = (totalCount % ps ) == 0 ? totalCount/ps : (totalCount/ps)+1;
        pageBean.setTotalPage(totalPage);

        return pageBean;
    }

    @Override
    public boolean deleteRent(int id) {
        return rentDao.deleteRent(id);
    }

    @Override
    public Rent findRentById(int id) {
        return rentDao.findRentById(id);
    }
}
