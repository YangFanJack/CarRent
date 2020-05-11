package com.jack.service.impl;

import com.jack.dao.ContactDao;
import com.jack.dao.impl.ContactDaoImpl;
import com.jack.pojo.Message;
import com.jack.pojo.PageBean;
import com.jack.service.ContactService;

import java.util.Date;
import java.util.List;

public class ContactServiceImpl implements ContactService {

    private ContactDao contactDao = new ContactDaoImpl();

    public void setContactDao(ContactDao contactDao) {
        this.contactDao = contactDao;
    }

    @Override
    public boolean submit(Message message) {
        message.setIsRead(0);
        message.setTime(new Date());
        return contactDao.submit(message);
    }

    @Override
    public Message findMessageById(int id) {
        return contactDao.findMessageById(id);
    }

    @Override
    public boolean readMessage(Message message) {
        return contactDao.readMessage(message);
    }

    @Override
    public PageBean<Message> findMessageByPage(String currentPage, String pageSize, Message message) {
        int cp = Integer.parseInt(currentPage);
        int ps = Integer.parseInt(pageSize);

        //创建新的pageBean对象
        PageBean<Message> pageBean = new PageBean<>();
        //设置参数
        pageBean.setCurrentPage(cp);
        pageBean.setPageSize(ps);

        //调用dao查询总记录数
        int totalCount = contactDao.findTotalCount(message);
        pageBean.setTotalCount(totalCount);

        //调用dao查询list集合
        //计算开始的索引
        int start = (cp-1)*ps;
        List<Message> rentList = contactDao.findMessageByPage(start,ps,message);
        pageBean.setList(rentList);

        //设置总页码
        int totalPage = (totalCount % ps ) == 0 ? totalCount/ps : (totalCount/ps)+1;
        pageBean.setTotalPage(totalPage);

        return pageBean;
    }
}
