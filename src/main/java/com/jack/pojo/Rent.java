package com.jack.pojo;

public class Rent {
    private int id;
    private String item;
    private String content;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getItem() {
        return item;
    }

    public void setItem(String item) {
        this.item = item;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    @Override
    public String toString() {
        return "Rent{" +
                "id=" + id +
                ", item='" + item + '\'' +
                ", content='" + content + '\'' +
                '}';
    }
}
