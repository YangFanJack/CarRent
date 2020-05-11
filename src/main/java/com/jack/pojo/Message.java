package com.jack.pojo;

import java.util.Date;

public class Message {
    private int id;
    private String name;
    private String mail;
    private String messageItem;
    private String messageContent;
    private Date time;
    private int isRead;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getMail() {
        return mail;
    }

    public void setMail(String mail) {
        this.mail = mail;
    }

    public String getMessageItem() {
        return messageItem;
    }

    public void setMessageItem(String messageItem) {
        this.messageItem = messageItem;
    }

    public String getMessageContent() {
        return messageContent;
    }

    public void setMessageContent(String messageContent) {
        this.messageContent = messageContent;
    }

    public int getIsRead() {
        return isRead;
    }

    public void setIsRead(int isRead) {
        this.isRead = isRead;
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    @Override
    public String toString() {
        return "Message{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", mail='" + mail + '\'' +
                ", messageItem='" + messageItem + '\'' +
                ", messageContent='" + messageContent + '\'' +
                ", time=" + time +
                ", isRead=" + isRead +
                '}';
    }
}
