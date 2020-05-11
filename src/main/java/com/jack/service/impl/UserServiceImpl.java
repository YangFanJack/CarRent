package com.jack.service.impl;

import com.jack.dao.UserDao;
import com.jack.pojo.PageBean;
import com.jack.pojo.User;
import com.jack.service.UserService;

import java.util.List;

public class UserServiceImpl implements UserService {

    private UserDao userDao;

    public void setUserDao(UserDao userDao) {
        this.userDao = userDao;
    }

    @Override
    public boolean login(User user) {
        return userDao.login(user);
    }

    @Override
    public boolean register(User user) {
        return userDao.register(user);
    }

    @Override
    public PageBean<User> findUserByPage(String currentPage, String pageSize, User user) {
        int cp = Integer.parseInt(currentPage);
        int ps = Integer.parseInt(pageSize);


        //创建新的pageBean对象
        PageBean<User> pageBean = new PageBean<>();
        //设置参数
        pageBean.setCurrentPage(cp);
        pageBean.setPageSize(ps);

        //调用dao查询总记录数
        int totalCount = userDao.findTotalCount(user);
        pageBean.setTotalCount(totalCount);

        //调用dao查询list集合
        //计算开始的索引
        int start = (cp-1)*ps;
        List<User> userList = userDao.findUserByPage(start,ps,user);
        pageBean.setList(userList);

        //设置总页码
        int totalPage = (totalCount % ps ) == 0 ? totalCount/ps : (totalCount/ps)+1;
        pageBean.setTotalPage(totalPage);

        return pageBean;
    }

    @Override
    public boolean deleteUser(String userName) {
        return userDao.deleteUser(userName);
    }
}
