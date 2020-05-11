package com.jack.action;

import com.jack.pojo.Car;
import com.jack.pojo.PageBean;
import com.jack.pojo.ResultInfo;
import com.jack.service.CarService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import org.apache.struts2.ServletActionContext;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CarAction extends ActionSupport implements ModelDriven<Car> {

    private ResultInfo resultInfo = new ResultInfo();
    //属性驱动
    private String currentPage;
    private String pageSize;
    private String total;
    private String page;
    //模型驱动
    private Car car = new Car();

    @Override
    public Car getModel() {
        return car;
    }

    private CarService carService;

    public void setCarService(CarService carService) {
        this.carService = carService;
    }

    /**
     * 添加车辆
     * @return
     */
    public String addCar(){
        System.out.println("addCar");
        HttpServletResponse response = ServletActionContext.getResponse();
        HttpServletRequest request = ServletActionContext.getRequest();
        if(!carService.addCar(car)){
            resultInfo.setMsg("因为数据库写入失败，添加车辆失败!");
            resultInfo.setFlag(false);
            return ERROR;
        }
        resultInfo.setMsg("添加车辆成功!");
        resultInfo.setFlag(true);
        return SUCCESS;
    }

    /**
     * 修改车辆
     * @return
     */
    public String updateCar(){
        System.out.println("updateCar");
        HttpServletResponse response = ServletActionContext.getResponse();
        HttpServletRequest request = ServletActionContext.getRequest();
        if(!carService.updateCar(car)){
            resultInfo.setMsg("因为数据库写入失败，修改车辆失败!");
            resultInfo.setFlag(false);
            return ERROR;
        }
        resultInfo.setMsg("修改车辆成功!");
        resultInfo.setFlag(true);
        return SUCCESS;
    }

    /**
     * 分页查询车辆信息
     * @return
     */
    public String findCarByPage(){
        if(page == null || page.equals("")){
            page="manageFunc";
        }
        if(currentPage == null || "".equals(currentPage)){
            currentPage="1";
        }
        if(pageSize == null || "".equals(pageSize)){
            pageSize="3";
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
        PageBean<Car> pageBean = carService.findCarByPage(currentPage,pageSize,car);

        resultInfo.setFlag(true);
        resultInfo.setData(pageBean);
        ActionContext.getContext().put("condition",car);
        System.out.println(car);
        return SUCCESS;
    }

    /**
     * 根据id查找车辆信息
     * @return
     */
    public String findCarById(){
        if(page == null || page.equals("")){
            page="manageFunc";
        }
        Car car1 = carService.findCarById(car.getId());
        if(car1!=null){
            resultInfo.setFlag(true);
            resultInfo.setData(car1);
            return SUCCESS;
        }
        else{
            resultInfo.setFlag(false);
            return ERROR;
        }
    }

    /**
     * 删除车辆
     * @return
     */
    public String deleteCar(){
        boolean flag = carService.deleteCar(car.getId());
        if(flag){
            return SUCCESS;
        }
        else{
            return ERROR;
        }
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

    public String getCurrentPage() {
        return currentPage;
    }

    public void setCurrentPage(String currentPage) {
        this.currentPage = currentPage;
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
