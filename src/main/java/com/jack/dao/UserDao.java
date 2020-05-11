package com.jack.dao;

import com.jack.pojo.User;

import java.util.List;

public interface UserDao {
    public boolean login(User user);
    public boolean register(User user);
    public int findTotalCount(User user);
    public List<User> findUserByPage(int start, int ps, User user);
    public boolean deleteUser(String userName);
}
