package com.jack.action;

import com.jack.pojo.PageBean;
import com.jack.pojo.ResultInfo;
import com.jack.pojo.User;
import com.jack.service.UserService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import org.apache.struts2.ServletActionContext;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class UserAction extends ActionSupport implements ModelDriven<User> {

    private String checkCode;
    private String page;
    private ResultInfo resultInfo = new ResultInfo();
    //属性驱动
    private String currentPage;
    private String pageSize;
    private String total;
    //模型驱动
    private User user = new User();

    @Override
    public User getModel() {
        return user;
    }

    private UserService userService;

    public void setUserService(UserService userService) {
        this.userService = userService;
    }

    /**
     * 用户登录
     * @return
     */
    public String login(){
        System.out.println("userLogin");
        HttpServletRequest request = ServletActionContext.getRequest();
        HttpSession session = request.getSession();
//        System.out.println(userService);
        if(userService.login(user)){
            session.setAttribute("loginUser",user.getUserName());
            session.setAttribute("mark","user");
            resultInfo.setFlag(true);
            return SUCCESS;
        }
        resultInfo.setMsg("用户名或者密码错误，请检查后重新登录!");
        resultInfo.setFlag(false);
        return ERROR;
    }

    /**
     * 用户注册
     * @return
     */
    public String register(){
        System.out.println("userRegister");
        HttpServletResponse response = ServletActionContext.getResponse();
        HttpServletRequest request = ServletActionContext.getRequest();
        //验证码校验
        String checkcode_server = (String) request.getSession().getAttribute("CHECKCODE_SERVER");

        //防止返回时验证码仍然有效
        request.getSession().removeAttribute("CHECKCODE_SERVER");
        if(checkcode_server == null || !checkCode.equalsIgnoreCase(checkcode_server)){
            resultInfo.setMsg("验证码错误，注册失败!");
            resultInfo.setFlag(false);
            return ERROR;
        }
        if(!userService.register(user)){
            resultInfo.setMsg("因为数据库写入失败，注册失败!");
            resultInfo.setFlag(false);
            return ERROR;
        }
        resultInfo.setMsg("注册成功!");
        resultInfo.setFlag(true);
        return SUCCESS;
    }

    /**
     * 分页查询用户
     * @return
     */
    public String findUserByPage(){
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
        PageBean<User> pageBean = userService.findUserByPage(currentPage,pageSize,user);

        resultInfo.setFlag(true);
        resultInfo.setData(pageBean);
        ActionContext.getContext().put("condition",user);
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
     * 删除用户
     * @return
     */
    public String deleteUser(){
        boolean flag = userService.deleteUser(user.getUserName());
        if(flag){
            return SUCCESS;
        }
        else{
            return ERROR;
        }
    }

    public String getCheckCode() {
        return checkCode;
    }

    public void setCheckCode(String checkCode) {
        this.checkCode = checkCode;
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

    public String getPage() {
        return page;
    }

    public void setPage(String page) {
        this.page = page;
    }
}
