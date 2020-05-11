package com.jack.dao.impl;

import com.jack.dao.RentDao;
import com.jack.pojo.Rent;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Transactional
public class RentDaoImpl implements RentDao {
    private SessionFactory sessionFactory;

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    public Session getSession(){
        return this.sessionFactory.getCurrentSession();
    }

    @Override
    public boolean addRent(Rent rent) {
        if(rent.getItem().equals("") || rent.getContent().equals("")){
            return false;
        }
        else{
            getSession().save(rent);
            return true;
        }
    }

    @Override
    public boolean updateRent(Rent rent) {
        String hql = "from Rent r where r.item=?1";
        Query query = getSession().createQuery(hql);

        query.setParameter(1,rent.getItem());//设置第一个？值

        Rent rent1 = (Rent) query.uniqueResult();

        if(rent.getItem().equals("") || rent.getContent().equals("")){
            System.out.println("false");
            return false;
        }
        else{
            rent1.setItem(rent.getItem());
            rent1.setContent(rent.getContent());
            getSession().update(rent1);
            return true;
        }
    }

    @Override
    public int findTotalCount(Rent rent) {
        String hql = "select count(id) from Rent r where 1 = 1 ";
        StringBuilder sb = new StringBuilder(hql);
        if(rent.getContent() != null){
            sb.append(" and r.content like '%"+rent.getContent()+"%' ");
        }
        hql = sb.toString();
        Integer count = Integer.parseInt(String.valueOf(getSession().createQuery(hql).uniqueResult()));
        return count;
    }

    @Override
    public List<Rent> findCarByPage(int start, int ps, Rent rent) {
        String hql = "from Rent r where 1 = 1 ";
        StringBuilder sb = new StringBuilder(hql);
        if(rent.getContent() != null){
            sb.append(" and r.content like '%"+rent.getContent()+"%' ");
        }
        hql = sb.toString();

        Query query = getSession().createQuery(hql);
        //设置偏移量
        query.setFirstResult(start);
        //设置页面大小
        query.setMaxResults(ps);
        List<Rent> list = query.list();
        return list;
    }

    @Override
    public boolean deleteRent(int id) {
        String hql = "from Rent r where r.id = ?1 ";
        Query query = getSession().createQuery(hql);
        query.setParameter(1,id);
        Rent rent = (Rent) query.uniqueResult();
        if(rent != null){
            getSession().delete(rent);
            return true;
        }
        else{
            return false;
        }
    }

    @Override
    public Rent findRentById(int id) {
        String hql = "from Rent r where r.id=?1";
        Query query = getSession().createQuery(hql);
        query.setParameter(1,id);//设置第一个？值
        Rent rent1 = (Rent) query.uniqueResult();
        return rent1;
    }
}
