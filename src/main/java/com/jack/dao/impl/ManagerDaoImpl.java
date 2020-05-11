package com.jack.dao.impl;

import com.jack.dao.ManagerDao;
import com.jack.pojo.Manager;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Transactional
public class ManagerDaoImpl implements ManagerDao {

    private SessionFactory sessionFactory;

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    public Session getSession(){
        return this.sessionFactory.getCurrentSession();
    }

    @Override
    public boolean login(Manager manager) {
        //1 创建query对象
        //根据cid和custName查询
        String hql = "from Manager m where m.userName=?1 and m.password=?2";
        Query query = getSession().createQuery(hql);

        //2 设置条件值 ?值
        //？位置从0开始的
        query.setParameter(1,manager.getUserName());//设置第一个？值
        query.setParameter(2,manager.getPassword());//设置第二个？值

        //3 调用query的方法得到结果
        List list = query.list();
        System.out.println(list);
        if(list.size() != 0){
            return true;
        }
        else{
            return false;
        }
    }

    @Override
    public boolean addManager(Manager manager) {
        String hql = "from Manager m where m.userName=?1";
        Query query = getSession().createQuery(hql);

        //2 设置条件值 ?值
        //？位置从0开始的
        query.setParameter(1,manager.getUserName());//设置第一个？值

        //3 调用query的方法得到结果
        List list = query.list();

        if(list.size() != 0){
            return false;
        }
        else{
            getSession().save(manager);
            return true;
        }
    }

    @Override
    public int findTotalCount(Manager manager) {
        String hql = "select count(id) from Manager m where 1 = 1 ";
        StringBuilder sb = new StringBuilder(hql);
        if(manager.getUserName() != null){
            sb.append(" and m.userName like '%"+manager.getUserName()+"%' ");
        }
        hql = sb.toString();
        Integer count = Integer.parseInt(String.valueOf(getSession().createQuery(hql).uniqueResult()));
        return count;
    }

    @Override
    public List<Manager> findManagerByPage(int start, int ps, Manager manager) {
        String hql = "from Manager m where 1 = 1 ";
        StringBuilder sb = new StringBuilder(hql);
        if(manager.getUserName() != null){
            sb.append(" and m.userName like '%"+manager.getUserName()+"%' ");
        }
        hql = sb.toString();

        Query query = getSession().createQuery(hql);
        //设置偏移量
        query.setFirstResult(start);
        //设置页面大小
        query.setMaxResults(ps);
        List<Manager> list = query.list();
        return list;
    }

    @Override
    public boolean deleteManager(String userName) {
        String hql = "from Manager m where m.userName = ?1 ";
        Query query = getSession().createQuery(hql);
        query.setParameter(1,userName);
        Manager manager = (Manager) query.uniqueResult();
        if(manager != null){
            getSession().delete(manager);
            return true;
        }
        else{
            return false;
        }
    }
}
