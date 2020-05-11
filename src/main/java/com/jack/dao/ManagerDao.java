package com.jack.dao;

import com.jack.pojo.Manager;

import java.util.List;

public interface ManagerDao {
    public boolean login(Manager manager);
    public boolean addManager(Manager manager);
    public int findTotalCount(Manager manager);
    public List<Manager> findManagerByPage(int start, int ps, Manager manager);
    public boolean deleteManager(String userName);
}
