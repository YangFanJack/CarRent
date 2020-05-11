package com.jack.dao;

import com.jack.pojo.Message;

import java.util.List;

public interface ContactDao {
    public boolean submit(Message message);

    Message findMessageById(int id);

    boolean readMessage(Message message);

    int findTotalCount(Message message);

    List<Message> findMessageByPage(int start, int ps, Message message);
}
