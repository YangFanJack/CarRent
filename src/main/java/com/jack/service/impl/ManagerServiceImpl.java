package com.jack.service.impl;

import com.jack.dao.ManagerDao;
import com.jack.pojo.Manager;
import com.jack.pojo.PageBean;
import com.jack.service.ManagerService;

import java.util.List;

public class ManagerServiceImpl implements ManagerService {

    ManagerDao managerDao;

    public void setManagerDao(ManagerDao managerDao) {
        this.managerDao = managerDao;
    }

    @Override
    public boolean login(Manager manager) {
        return managerDao.login(manager);
    }

    @Override
    public boolean addManager(Manager manager) {
        return managerDao.addManager(manager);
    }

    @Override
    public PageBean<Manager> findManagerByPage(String currentPage, String pageSize, Manager manager) {

        int cp = Integer.parseInt(currentPage);
        int ps = Integer.parseInt(pageSize);

        //创建新的pageBean对象
        PageBean<Manager> pageBean = new PageBean<>();
        //设置参数
        pageBean.setCurrentPage(cp);
        pageBean.setPageSize(ps);

        //调用dao查询总记录数
        int totalCount = managerDao.findTotalCount(manager);
        pageBean.setTotalCount(totalCount);

        //调用dao查询list集合
        //计算开始的索引
        int start = (cp-1)*ps;
        List<Manager> managerList = managerDao.findManagerByPage(start,ps,manager);
        pageBean.setList(managerList);

        //设置总页码
        int totalPage = (totalCount % ps ) == 0 ? totalCount/ps : (totalCount/ps)+1;
        pageBean.setTotalPage(totalPage);

        return pageBean;
    }

    @Override
    public boolean deleteManager(String userName) {
        return managerDao.deleteManager(userName);
    }
}
