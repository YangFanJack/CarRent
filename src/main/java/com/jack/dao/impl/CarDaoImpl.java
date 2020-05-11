package com.jack.dao.impl;

import com.jack.dao.CarDao;
import com.jack.pojo.Car;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Transactional
public class CarDaoImpl implements CarDao {
    private SessionFactory sessionFactory;

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    public Session getSession(){
        return this.sessionFactory.getCurrentSession();
    }

    @Override
    public int findTotalCount(Car car) {
        String hql = "select count(id) from Car c where 1 = 1 ";
        StringBuilder sb = new StringBuilder(hql);
        if(car.getName() != null){
            sb.append(" and c.name like '%"+car.getName()+"%' ");
        }
        if(car.getType() != null){
            sb.append(" and c.type = '"+car.getType()+"' ");
        }
        if(car.getIsSale() != 0){
            sb.append(" and c.isSale = '"+car.getIsSale()+"' ");
        }
        hql = sb.toString();
        Integer count = Integer.parseInt(String.valueOf(getSession().createQuery(hql).uniqueResult()));
        return count;
    }

    @Override
    public List<Car> findCarByPage(int start, int ps, Car car) {
        String hql = "from Car c where 1 = 1 ";
        StringBuilder sb = new StringBuilder(hql);
        if(car.getName() != null){
            sb.append(" and c.name like '%"+car.getName()+"%' ");
        }
        if(car.getType() != null){
            sb.append(" and c.type = '"+car.getType()+"' ");
        }
        if(car.getIsSale() != 0){
            sb.append(" and c.isSale = '"+car.getIsSale()+"' ");
        }
        hql = sb.toString();

        Query query = getSession().createQuery(hql);
        //设置偏移量
        query.setFirstResult(start);
        //设置页面大小
        query.setMaxResults(ps);
        List<Car> list = query.list();
        return list;
    }

    @Override
    public boolean addCar(Car car) {
        String hql = "from Car c where c.name=?1";
        Query query = getSession().createQuery(hql);

        //2 设置条件值 ?值
        //？位置从0开始的
        query.setParameter(1,car.getName());//设置第一个？值

        //3 调用query的方法得到结果
        List list = query.list();

        if(list.size() != 0){
            return false;
        }
        else{
            getSession().save(car);
            return true;
        }
    }

    @Override
    public boolean deleteCar(int id) {
        String hql = "from Car c where c.id = ?1 ";
        Query query = getSession().createQuery(hql);
        query.setParameter(1,id);
        Car car = (Car) query.uniqueResult();
        if(car != null){
            getSession().delete(car);
            return true;
        }
        else{
            return false;
        }
    }

    @Override
    public boolean updateCar(Car car) {
        String hql = "from Car c where c.name=?1";
        Query query = getSession().createQuery(hql);

        query.setParameter(1,car.getName());//设置第一个？值

        Car car1 = (Car) query.uniqueResult();

        System.out.println(car);
        System.out.println("-------------------------");
        System.out.println(car1);

        if(car.getPrice()<0 || car.getUrl().equals("") || car.getType().equals("")){
            System.out.println("false");
            return false;
        }
        else{
            car1.setBrief(car.getBrief());
            car1.setDetails(car.getDetails());
            car1.setIsSale(car.getIsSale());
            car1.setPrice(car.getPrice());
            car1.setType(car.getType());
            car1.setUrl(car.getUrl());
            getSession().update(car1);
            return true;
        }
    }

    @Override
    public Car findCarById(int id) {
        String hql = "from Car c where c.id=?1";
        Query query = getSession().createQuery(hql);
        query.setParameter(1,id);//设置第一个？值
        Car car1 = (Car) query.uniqueResult();
        return car1;
    }
}
