package com.jack.action;

import com.jack.service.InitService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import java.util.List;

public class InitAction extends ActionSupport {

    private InitService initService;

    public void setInitService(InitService initService) {
        this.initService = initService;
    }

    public String findInit(){
        List list = initService.findInit();
        if(list.size()>0){
            ActionContext.getContext().put("list",list);
            return SUCCESS;
        }
        else{
            return ERROR;
        }
    }
}
