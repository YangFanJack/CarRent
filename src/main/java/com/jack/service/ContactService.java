package com.jack.service;

import com.jack.pojo.Message;
import com.jack.pojo.PageBean;

public interface ContactService {
    public boolean submit(Message message);

    Message findMessageById(int id);

    boolean readMessage(Message message);

    PageBean<Message> findMessageByPage(String currentPage, String pageSize, Message message);
}
