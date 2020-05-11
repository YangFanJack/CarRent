package com.jack.service;

import com.jack.pojo.Manager;
import com.jack.pojo.PageBean;

public interface ManagerService {
    public boolean login(Manager manager);
    public boolean addManager(Manager manager);
    public PageBean<Manager> findManagerByPage(String currentPage, String pageSize, Manager manager);
    public boolean deleteManager(String userName);
}
