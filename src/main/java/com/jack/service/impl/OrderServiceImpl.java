package com.jack.service.impl;

import com.jack.dao.OrderDao;
import com.jack.dao.impl.OrderDaoImpl;
import com.jack.pojo.Order;
import com.jack.pojo.PageBean;
import com.jack.service.OrderService;

import java.util.List;

public class OrderServiceImpl implements OrderService {
    private OrderDao orderDao = new OrderDaoImpl();

    public void setOrderDao(OrderDao orderDao) {
        this.orderDao = orderDao;
    }

    @Override
    public PageBean<Order> findOrderByPage(String currentPage, String pageSize, Order order) {
        int cp = Integer.parseInt(currentPage);
        int ps = Integer.parseInt(pageSize);

        //创建新的pageBean对象
        PageBean<Order> pageBean = new PageBean<>();
        //设置参数
        pageBean.setCurrentPage(cp);
        pageBean.setPageSize(ps);

        //调用dao查询总记录数
        int totalCount = orderDao.findTotalCount(order);
        pageBean.setTotalCount(totalCount);

        //调用dao查询list集合
        //计算开始的索引
        int start = (cp-1)*ps;
        List<Order> orderList = orderDao.findOrderByPage(start,ps,order);
        pageBean.setList(orderList);

        //设置总页码
        int totalPage = (totalCount % ps ) == 0 ? totalCount/ps : (totalCount/ps)+1;
        pageBean.setTotalPage(totalPage);

        return pageBean;
    }

    @Override
    public boolean confirmOrder(Order order) {
        return orderDao.confirmOrder(order);
    }

    @Override
    public boolean orderCar(Order order) {
        return orderDao.orderCar(order);
    }

    @Override
    public boolean deleteOrder(int id) {
        return orderDao.deleteOrder(id);
    }
}
