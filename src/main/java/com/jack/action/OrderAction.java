package com.jack.action;

import com.jack.pojo.Order;
import com.jack.pojo.PageBean;
import com.jack.pojo.ResultInfo;
import com.jack.service.OrderService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import java.util.Date;

public class OrderAction extends ActionSupport implements ModelDriven<Order> {

    private ResultInfo resultInfo = new ResultInfo();
    //属性驱动
    private String currentPage;
    private String pageSize;
    private String total;
    private String page;
    //模型驱动
    private Order order = new Order();

    @Override
    public Order getModel() {
        return order;
    }

    private OrderService orderService;

    public void setOrderService(OrderService orderService) {
        this.orderService = orderService;
    }

    /**
     * 下单
     * @return
     */
    public String orderCar(){
        System.out.println("orderCar");
        order.setIsConfirm(0);
        order.setTakeTime(new Date());
        order.setTotalPrice(order.getDays()*order.getCar().getPrice());
        System.out.println(order);
        if(!orderService.orderCar(order)){
            resultInfo.setMsg("因为数据库写入失败，订单提交失败!");
            resultInfo.setFlag(false);
            return ERROR;
        }
        resultInfo.setMsg("订单提交成功!");
        resultInfo.setFlag(true);
        return SUCCESS;
    }

    /**
     * 确认订单
     * @return
     */
    public String confirmOrder(){
        order.setIsConfirm(1);
        if(!orderService.confirmOrder(order)){
            resultInfo.setMsg("因为数据库写入失败，确认留言已读失败!");
            resultInfo.setFlag(false);
            return ERROR;
        }
        resultInfo.setMsg("确认已读成功!");
        resultInfo.setFlag(true);
        return SUCCESS;
    }

    /**
     * 分页查询订单
     * @return
     */
    public String findOrderByPage(){
        if(page == null || page.equals("")){
            page="manageFunc";
        }
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
        PageBean<Order> pageBean = orderService.findOrderByPage(currentPage,pageSize,order);

        resultInfo.setFlag(true);
        resultInfo.setData(pageBean);
        ActionContext.getContext().put("condition",order);
        System.out.println(order);
        return SUCCESS;
    }

    /**
     * 删除订单
     * @return
     */
    public String deleteOrder(){
        boolean flag = orderService.deleteOrder(order.getId());
        if(flag){
            return SUCCESS;
        }
        else{
            return ERROR;
        }
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

    public ResultInfo getResultInfo() {
        return resultInfo;
    }

    public String getPage() {
        return page;
    }

    public void setPage(String page) {
        this.page = page;
    }
}
