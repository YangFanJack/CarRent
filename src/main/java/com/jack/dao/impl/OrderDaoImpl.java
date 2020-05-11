package com.jack.dao.impl;

import com.jack.dao.OrderDao;
import com.jack.pojo.Order;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Transactional
public class OrderDaoImpl implements OrderDao {
    private SessionFactory sessionFactory;

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    public Session getSession(){
        return this.sessionFactory.getCurrentSession();
    }

    @Override
    public int findTotalCount(Order order) {
        String hql = "select count(id) from Order o where 1 = 1 ";
        StringBuilder sb = new StringBuilder(hql);
        if(order.getId()>0){
            sb.append(" and o.id = "+order.getId()+" ");
        }
        if(order.getUser()!=null && order.getUser().getId()>0){
            sb.append(" and o.user.id like "+order.getUser().getId()+" ");
        }
        sb.append(" and o.isConfirm = "+order.getIsConfirm()+" ");
        hql = sb.toString();
        Integer count = Integer.parseInt(String.valueOf(getSession().createQuery(hql).uniqueResult()));
        return count;
    }

    @Override
    public List<Order> findOrderByPage(int start, int ps, Order order) {
        String hql = "from Order o where 1 = 1 ";
        StringBuilder sb = new StringBuilder(hql);
        if(order.getId()>0){
            sb.append(" and o.id = "+order.getId()+" ");
        }
        if(order.getUser()!=null && order.getUser().getId()>0){
            sb.append(" and o.user.id like "+order.getUser().getId()+" ");
        }
        sb.append(" and o.isConfirm = "+order.getIsConfirm()+" ");
        hql = sb.toString();

        System.out.println("=================================");
        System.out.println(order);

        Query query = getSession().createQuery(hql);
        //设置偏移量
        query.setFirstResult(start);
        //设置页面大小
        query.setMaxResults(ps);
        List<Order> list = query.list();
        return list;
    }

    @Override
    public boolean confirmOrder(Order order) {
        String hql = "from Order o where o.id=?1";
        Query query = getSession().createQuery(hql);

        query.setParameter(1,order.getId());//设置第一个？值

        Order order1 = (Order) query.uniqueResult();
        order1.setIsConfirm(order.getIsConfirm());
        getSession().update(order1);
        return true;
    }

    @Override
    public boolean orderCar(Order order) {
        getSession().save(order);
        return true;
    }

    @Override
    public boolean deleteOrder(int id) {
        String hql = "from Order o where o.id = ?1 ";
        Query query = getSession().createQuery(hql);
        query.setParameter(1,id);
        Order order = (Order) query.uniqueResult();
        if(order != null){
            order.getUser().getOrders().remove(order);
            order.getCar().getOrders().remove(order);
            getSession().delete(order);
            return true;
        }
        else{
            return false;
        }
    }
}
