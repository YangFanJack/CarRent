package com.jack.action;

import com.jack.pojo.PageBean;
import com.jack.pojo.Rent;
import com.jack.pojo.ResultInfo;
import com.jack.service.RentService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class RentAction extends ActionSupport implements ModelDriven<Rent> {

    private ResultInfo resultInfo = new ResultInfo();
    //属性驱动
    private String currentPage;
    private String pageSize;
    private String total;
    private String page;
    private String it;
    //模型驱动
    private Rent rent = new Rent();

    @Override
    public Rent getModel() {
        return rent;
    }

    private RentService rentService;

    public void setRentService(RentService rentService) {
        this.rentService = rentService;
    }

    /**
     * 添加租车资讯
     * @return
     */
    public String addRent(){
        System.out.println("addRent");
        if(!rentService.addRent(rent)){
            resultInfo.setMsg("因为数据库写入失败，添加资讯失败!");
            resultInfo.setFlag(false);
            return ERROR;
        }
        resultInfo.setMsg("添加资讯成功!");
        resultInfo.setFlag(true);
        return SUCCESS;
    }

    /**
     * 修改租车资讯内容
     * @return
     */
    public String updateRent(){
        System.out.println("updateRent");
        if(!rentService.updateRent(rent)){
            resultInfo.setMsg("因为数据库写入失败，修改资讯失败!");
            resultInfo.setFlag(false);
            return ERROR;
        }
        resultInfo.setMsg("修改资讯成功!");
        resultInfo.setFlag(true);
        return SUCCESS;
    }

    /**
     * 分页查询租车资讯
     * @return
     */
    public String findRentByPage(){
        if(page == null || page.equals("")){
            page="manageFunc";
        }
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
        PageBean<Rent> pageBean = rentService.findRentByPage(currentPage,pageSize,rent);

        resultInfo.setFlag(true);
        resultInfo.setData(pageBean);
        ActionContext.getContext().put("condition",rent);
        return SUCCESS;
    }

    /**
     * 删除租车资讯
     * @return
     */
    public String deleteRent(){
        boolean flag = rentService.deleteRent(rent.getId());
        if(flag){
            return SUCCESS;
        }
        else{
            return ERROR;
        }
    }

    /**
     * 根据id查找rent信息
     * @return
     */
    public String findRentById(){
        Rent rent1 = rentService.findRentById(rent.getId());
        if(rent1!=null){
            resultInfo.setFlag(true);
            resultInfo.setData(rent1);
            return SUCCESS;
        }
        else{
            resultInfo.setFlag(false);
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

    public String getIt() {
        return it;
    }

    public void setIt(String it) {
        this.it = it;
    }
}
