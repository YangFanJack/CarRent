package com.jack.service;

import com.jack.pojo.PageBean;
import com.jack.pojo.User;

public interface UserService {
    public boolean login(User user);
    public boolean register(User user);
    public PageBean<User> findUserByPage(String currentPage, String rows, User user);
    public boolean deleteUser(String userName);
}
