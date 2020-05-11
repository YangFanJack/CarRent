package com.jack.action;

import com.jack.pojo.Message;
import com.jack.pojo.PageBean;
import com.jack.pojo.ResultInfo;
import com.jack.service.ContactService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import org.apache.struts2.ServletActionContext;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ContactAction extends ActionSupport implements ModelDriven<Message> {

    private ResultInfo resultInfo = new ResultInfo();
    private String page;
    //属性驱动
    private String currentPage;
    private String pageSize;
    private String total;
    //模型驱动
    private Message message =  new Message();

    @Override
    public Message getModel() {
        return message;
    }

    private ContactService contactService;

    public void setContactService(ContactService contactService) {
        this.contactService = contactService;
    }

    /**
     * 提交建议
     * @return
     */
    public String submitMessage(){
        System.out.println("contact");
        HttpServletResponse response = ServletActionContext.getResponse();
        HttpServletRequest request = ServletActionContext.getRequest();

        page = (String) request.getSession().getAttribute("path");
//        System.out.println("----------------------");
//        System.out.println(page);
//        System.out.println("----------------------");
        if(!contactService.submit(message)){
            resultInfo.setMsg("留言失败！");
            resultInfo.setFlag(false);
            return ERROR;
        }
        resultInfo.setMsg("留言成功");
        resultInfo.setFlag(true);
        return SUCCESS;
    }

    /**
     * 分页查询建议
     * @return
     */
    public String findMessageByPage(){
        if(currentPage == null || "".equals(currentPage)){
            currentPage="1";
        }
        if(pageSize == null || "".equals(pageSize)){
            pageSize="5";
        }
        if(Integer.parseInt(currentPage) <= 1){
            currentPage = "1";
        }
        if(total!=null){
            int total1 = Integer.parseInt(total);
            if(Integer.parseInt(currentPage) >= total1){
                currentPage = total;
            }
        }
        PageBean<Message> pageBean = contactService.findMessageByPage(currentPage,pageSize,message);

        resultInfo.setFlag(true);
        resultInfo.setData(pageBean);
        ActionContext.getContext().put("condition",message);
        return SUCCESS;
    }

    /**
     * 确认已读留言
     * @return
     */
    public String readMessage(){
        page="findMessageByPage.do?isRead="+message.getIsRead();
        message.setIsRead(1);
        if(!contactService.readMessage(message)){
            resultInfo.setMsg("因为数据库写入失败，确认留言已读失败!");
            resultInfo.setFlag(false);
            return ERROR;
        }
        resultInfo.setMsg("确认已读成功!");
        resultInfo.setFlag(true);
        return SUCCESS;
    }

    /**
     * 根据id查找留言
     * @return
     */
    public String findMessageById(){
        Message message1 = contactService.findMessageById(message.getId());
        if(message1!=null){
            resultInfo.setFlag(true);
            resultInfo.setData(message1);
            return SUCCESS;
        }
        else{
            resultInfo.setFlag(false);
            return ERROR;
        }
    }

    public String getPage() {
        return page;
    }

    public void setPage(String page) {
        this.page = page;
    }

    public Message getMessage() {
        return message;
    }

    public void setMessage(Message message) {
        this.message = message;
    }

    public ResultInfo getResultInfo() {
        return resultInfo;
    }

    public String getCurrentPage() {
        return currentPage;
    }

    public void setCurrentPage(String currentPage) {
        this.currentPage = currentPage;
    }

    public String getPageSize() {
        return pageSize;
    }

    public void setPageSize(String pageSize) {
        this.pageSize = pageSize;
    }

    public String getTotal() {
        return total;
    }

    public void setTotal(String total) {
        this.total = total;
    }
}

