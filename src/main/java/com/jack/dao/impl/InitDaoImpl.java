package com.jack.dao.impl;

import com.jack.dao.InitDao;
import com.jack.pojo.Car;
import com.jack.pojo.Rent;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Transactional
public class InitDaoImpl implements InitDao {

    private SessionFactory sessionFactory;

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    public Session getSession(){
        return this.sessionFactory.getCurrentSession();
    }

    @Override
    public List<Car> findInitCar() {
        String hql = "from Car c";
        Query query = getSession().createQuery(hql);
        List<Car> carList = query.list();
        return carList;
    }

    @Override
    public List<Rent> findInitRent() {
        String hql = "from Rent r";
        Query query = getSession().createQuery(hql);
        List<Rent> rentList = query.list();
        return rentList;
    }
}
