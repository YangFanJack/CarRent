package com.jack.action;

import com.jack.pojo.Manager;
import com.jack.pojo.PageBean;
import com.jack.pojo.ResultInfo;
import com.jack.service.ManagerService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import org.apache.struts2.ServletActionContext;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class ManagerAction extends ActionSupport implements ModelDriven<Manager> {

    private String checkCode;
    private ResultInfo resultInfo = new ResultInfo();
    //属性驱动
    private String currentPage;
    private String pageSize;
    private String total;
    //模型封装
    private Manager manager = new Manager();

    @Override
    public Manager getModel() {
        return manager;
    }

    private ManagerService managerService;

    public void setManagerService(ManagerService managerService) {
        this.managerService = managerService;
    }

    /**
     * 管理员登录
     * @return
     */
    public String login(){
        System.out.println("managerLogin");
        HttpServletRequest request = ServletActionContext.getRequest();
        HttpSession session = request.getSession();;
        if(managerService.login(manager)){
            session.setAttribute("loginUser",manager.getUserName());
            session.setAttribute("mark","manager");
            resultInfo.setFlag(true);
            return SUCCESS;
        }
        resultInfo.setMsg("管理员名或者密码错误，请检查后重新登录!");
        resultInfo.setFlag(false);
        return ERROR;
    }

    /**
     * 添加管理员
     * @return
     */
    public String addManager(){
        System.out.println("addManager");
        HttpServletResponse response = ServletActionContext.getResponse();
        HttpServletRequest request = ServletActionContext.getRequest();
        //验证码校验
        String checkcode_server = (String) request.getSession().getAttribute("CHECKCODE_SERVER");

        //防止返回时验证码仍然有效
        request.getSession().removeAttribute("CHECKCODE_SERVER");
        if(checkcode_server == null || !checkCode.equalsIgnoreCase(checkcode_server)){
            resultInfo.setMsg("验证码错误，添加管理员失败!");
            resultInfo.setFlag(false);
            return ERROR;
        }
        if(!managerService.addManager(manager)){
            resultInfo.setMsg("因为数据库写入失败，添加管理员失败!");
            resultInfo.setFlag(false);
            return ERROR;
        }
        resultInfo.setMsg("添加管理员成功!");
        resultInfo.setFlag(true);
        return SUCCESS;
    }

    /**
     * 退出用户登录
     * @return
     */
    public String exitLogin(){
        HttpServletRequest request = ServletActionContext.getRequest();
        HttpSession session = request.getSession();
        session.removeAttribute("loginUser");
        session.removeAttribute("mark");
        return SUCCESS;
    }

    /**
     * 分页查询管理员信息
     * @return
     */
    public String findManagerByPage(){
        if(currentPage == null || "".equals(currentPage)){
            currentPage="1";
        }
        if(pageSize == null || "".equals(pageSize)){
            pageSize="10";
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
        PageBean<Manager> pageBean = managerService.findManagerByPage(currentPage,pageSize,manager);

        resultInfo.setFlag(true);
        resultInfo.setData(pageBean);
        ActionContext.getContext().put("condition",manager);
        return SUCCESS;
    }

    /**
     * 删除管理员
     * @return
     */
    public String deleteManager(){
        boolean flag = managerService.deleteManager(manager.getUserName());
        if(flag){
            return SUCCESS;
        }
        else{
            return ERROR;
        }
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

    public String getCheckCode() {
        return checkCode;
    }

    public void setCheckCode(String checkCode) {
        this.checkCode = checkCode;
    }
}
