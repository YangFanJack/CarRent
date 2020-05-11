package com.jack.dao.impl;

import com.jack.dao.UserDao;
import com.jack.pojo.User;
import org.apache.struts2.ServletActionContext;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.transaction.annotation.Transactional;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Transactional
public class UserDaoImpl implements UserDao {

    private SessionFactory sessionFactory;

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    public Session getSession(){
        return this.sessionFactory.getCurrentSession();
    }

    @Override
    public boolean login(User user) {

        //1 创建query对象
        //根据cid和custName查询
        String hql = "from User u where u.userName=?1 and u.password=?2";
        Query query = getSession().createQuery(hql);

        //2 设置条件值 ?值
        //？位置从0开始的
        query.setParameter(1,user.getUserName());//设置第一个？值
        query.setParameter(2,user.getPassword());//设置第二个？值

        //3 调用query的方法得到结果
        User user1 = (User)query.uniqueResult();
        HttpServletRequest request = ServletActionContext.getRequest();
        HttpSession session = request.getSession();
        if(user1 != null){
            session.setAttribute("loginUserId",user1.getId());
            return true;
        }
        else{
            return false;
        }
    }

    @Override
    public boolean register(User user) {
        String hql = "from User u where u.userName=?1";
        Query query = getSession().createQuery(hql);

        //2 设置条件值 ?值
        //？位置从0开始的
        query.setParameter(1,user.getUserName());//设置第一个？值

        //3 调用query的方法得到结果
        List list = query.list();

        if(list.size() != 0){
            return false;
        }
        else{
            getSession().save(user);
            return true;
        }
    }

    @Override
    public int findTotalCount(User user) {
        String hql = "select count(id) from User u where 1 = 1 ";
        StringBuilder sb = new StringBuilder(hql);
        if(user.getUserName() != null){
            sb.append(" and u.userName like '%"+user.getUserName()+"%' ");
        }
        hql = sb.toString();
        Integer count = Integer.parseInt(String.valueOf(getSession().createQuery(hql).uniqueResult()));
        System.out.println(count);
        return count;
    }

    @Override
    public List<User> findUserByPage(int start, int ps, User user) {
        String hql = "from User u where 1 = 1 ";
        StringBuilder sb = new StringBuilder(hql);
        if(user.getUserName() != null){
            sb.append(" and u.userName like '%"+user.getUserName()+"%' ");
        }
        hql = sb.toString();

        Query query = getSession().createQuery(hql);
        //设置偏移量
        query.setFirstResult(start);
        //设置页面大小
        query.setMaxResults(ps);
        List<User> list = query.list();
        return list;
    }

    @Override
    public boolean deleteUser(String userName) {
        String hql = "from User u where u.userName = ?1 ";
        Query query = getSession().createQuery(hql);
        query.setParameter(1,userName);
        User user = (User) query.uniqueResult();
        if(user != null){
            getSession().delete(user);
            return true;
        }
        else{
            return false;
        }
    }
}
