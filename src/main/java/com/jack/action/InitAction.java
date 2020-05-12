package com.jack.action;

import com.jack.service.InitService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import java.util.List;

public class InitAction extends ActionSupport {

    private String msg;

    private InitService initService;

    public void setInitService(InitService initService) {
        this.initService = initService;
    }

    public String findInit(){
        System.out.println(msg);
        if(msg!=null){
            if(msg.equals("1")){
                msg="留言成功";
            }
            else{
                msg="留言失败";
            }
        }
        List list = initService.findInit();
        if(list.size()>0){
            ActionContext.getContext().put("list",list);
            return SUCCESS;
        }
        else{
            return ERROR;
        }
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }
}
