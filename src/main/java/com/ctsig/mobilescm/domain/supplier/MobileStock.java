package com.ctsig.mobilescm.domain.supplier;

import com.ctsig.mobilescm.domain.basic.Department;
import com.ctsig.mobilescm.domain.basic.MobileType;
import com.ctsig.mobilescm.domain.basic.Supplier;

import java.io.Serializable;
import java.util.Date;

/**
 * 手机库存
 */
public class MobileStock implements Serializable {

    private static final long serialVersionUID = 5398172630061696633L;

    /**
     * 串号一：作主键用
     */
    private String numberOne;

    /**
     * 串号二
     */
    private String numberTwo;

    /**
     * 入库单号
     */
    private String mobileStorageId;

    /**
     * 手机型号
     */
    private MobileType mobileType;

    /**
     * 颜色
     */
    private String color;

    /**
     * 配置
     */
    private String config;

    /**
     * 首期供应商
     */
    private Supplier firstSupplier;

    /**
     * 首期入库日期
     */
    private Date firstStockDate;

    /**
     * 尾期供应商
     */
    private Supplier lastSupplier;

    /**
     * 尾期入库日期
     */
    private Date lastStockDate;

    /**
     * 入库价
     */
    private Double buyPrice;

    /**
     * 成本
     */
    private Double cost;

    /**
     * 报损金额
     */
    private Double lossAmount;

    /**
     * 部门
     */
    private Department department;

    /**
     * 状态
     */
    private Integer status;

    public String getNumberOne() {
        return numberOne;
    }

    public void setNumberOne(String numberOne) {
        this.numberOne = numberOne;
    }

    public String getNumberTwo() {
        return numberTwo;
    }

    public void setNumberTwo(String numberTwo) {
        this.numberTwo = numberTwo;
    }

    public String getMobileStorageId() {
        return mobileStorageId;
    }

    public void setMobileStorageId(String mobileStorageId) {
        this.mobileStorageId = mobileStorageId;
    }

    public MobileType getMobileType() {
        return mobileType;
    }

    public void setMobileType(MobileType mobileType) {
        this.mobileType = mobileType;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public String getConfig() {
        return config;
    }

    public void setConfig(String config) {
        this.config = config;
    }

    public Supplier getFirstSupplier() {
        return firstSupplier;
    }

    public void setFirstSupplier(Supplier firstSupplier) {
        this.firstSupplier = firstSupplier;
    }

    public Date getFirstStockDate() {
        return firstStockDate;
    }

    public void setFirstStockDate(Date firstStockDate) {
        this.firstStockDate = firstStockDate;
    }

    public Supplier getLastSupplier() {
        return lastSupplier;
    }

    public void setLastSupplier(Supplier lastSupplier) {
        this.lastSupplier = lastSupplier;
    }

    public Date getLastStockDate() {
        return lastStockDate;
    }

    public void setLastStockDate(Date lastStockDate) {
        this.lastStockDate = lastStockDate;
    }

    public Double getBuyPrice() {
        return buyPrice;
    }

    public void setBuyPrice(Double buyPrice) {
        this.buyPrice = buyPrice;
    }

    public Double getCost() {
        return cost;
    }

    public void setCost(Double cost) {
        this.cost = cost;
    }

    public Double getLossAmount() {
        return lossAmount;
    }

    public void setLossAmount(Double lossAmount) {
        this.lossAmount = lossAmount;
    }

    public Department getDepartment() {
        return department;
    }

    public void setDepartment(Department department) {
        this.department = department;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

}