package com.jack.dao;

import com.jack.pojo.Order;

import java.util.List;

public interface OrderDao {
    int findTotalCount(Order order);

    List<Order> findOrderByPage(int start, int ps, Order order);

    boolean confirmOrder(Order order);

    boolean orderCar(Order order);

    boolean deleteOrder(int id);
}
