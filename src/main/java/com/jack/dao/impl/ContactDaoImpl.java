package com.jack.dao.impl;

import com.jack.dao.ContactDao;
import com.jack.pojo.Message;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Transactional
public class ContactDaoImpl implements ContactDao {

    private SessionFactory sessionFactory;

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    public Session getSession(){
        return this.sessionFactory.getCurrentSession();
    }

    @Override
    public boolean submit(Message message) {
        getSession().save(message);
        return true;
    }

    @Override
    public Message findMessageById(int id) {
        String hql = "from Message m where m.id=?1";
        Query query = getSession().createQuery(hql);
        query.setParameter(1,id);//设置第一个？值
        Message message1 = (Message) query.uniqueResult();
        return message1;
    }

    @Override
    public boolean readMessage(Message message) {
        String hql = "from Message m where m.id=?1";
        Query query = getSession().createQuery(hql);

        query.setParameter(1,message.getId());//设置第一个？值

        Message message1 = (Message) query.uniqueResult();
        message1.setIsRead(message.getIsRead());
        getSession().update(message1);
        return true;
    }

    @Override
    public int findTotalCount(Message message) {
        String hql = "select count(id) from Message m where 1 = 1 ";
        StringBuilder sb = new StringBuilder(hql);
        if(message.getMessageContent() != null){
            sb.append(" and m.messageContent like '%"+message.getMessageContent()+"%' ");
        }
        sb.append(" and m.isRead = "+message.getIsRead()+" ");
        hql = sb.toString();
        Integer count = Integer.parseInt(String.valueOf(getSession().createQuery(hql).uniqueResult()));
        return count;
    }

    @Override
    public List<Message> findMessageByPage(int start, int ps, Message message) {
        String hql = "from Message m where 1 = 1 ";
        StringBuilder sb = new StringBuilder(hql);
        if(message.getMessageContent() != null){
            sb.append(" and m.messageContent like '%"+message.getMessageContent()+"%' ");
        }
        sb.append(" and m.isRead = "+message.getIsRead()+" ");
        hql = sb.toString();

        Query query = getSession().createQuery(hql);
        //设置偏移量
        query.setFirstResult(start);
        //设置页面大小
        query.setMaxResults(ps);
        List<Message> list = query.list();
        return list;
    }
}
