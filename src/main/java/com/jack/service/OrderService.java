package com.jack.service;

import com.jack.pojo.Order;
import com.jack.pojo.PageBean;

public interface OrderService {
    PageBean<Order> findOrderByPage(String currentPage, String pageSize, Order order);

    boolean confirmOrder(Order order);

    boolean orderCar(Order order);

    boolean deleteOrder(int id);
}
