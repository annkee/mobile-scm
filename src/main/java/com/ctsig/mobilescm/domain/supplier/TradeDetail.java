package com.ctsig.mobilescm.domain.supplier;

import com.ctsig.mobilescm.domain.basic.Department;
import com.ctsig.mobilescm.domain.basic.Supplier;

import java.io.Serializable;
import java.util.Date;

/**
 * 交易明细
 */
public class TradeDetail implements Serializable {

    private static final long serialVersionUID = -8805192499942333371L;
    private String show;

    public String getShow() {
        return show;
    }

    public void setShow(String show) {
        this.show = show;
    }

    /**
     * 单号
     */
    private String id;

    /**
     * 状态
     */
    private Integer status;
    private String statusName;

    /**
     * 供应商编号
     */
    private Supplier supplier;

    /**
     * 业务类型
     */
    private Integer tradeType;
    private String tradeTypeName;

    /**
     * 型号编号:可能是手机型号ID，可能是配件型号ID
     */
    private String typeId;

    /**
     * 数量
     */
    private Integer amount;

    /**
     * 单价
     */
    private Double unitPrice;

    /**
     * 录入日期
     */
    private Date inputDate;
    /**
     * 录入人员
     */
    private String inputUserId;
    private String inputUserName;

    /**
     * 审核日期
     */
    private Date checkDate;
    /**
     * 审核人员
     */
    private String checkUserId;
    private String checkUserName;

    /**
     * 总金额
     */
    private Double totalMoney;

    /**
     * 机构编号
     */
    private Department department;

    /**
     * 备注
     */
    private String remark;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
        switch (status) {
            case StaticVariable.STATUS_CHECKED:
                this.statusName = StaticVariable.STATUS_NAME_CHECKED;
                break;
            case StaticVariable.STATUS_NOTCHECK:
                this.statusName = StaticVariable.STATUS_NAME_NOTCHECK;
                break;
        }
    }

    public String getStatusName() {
        return statusName;
    }

    public void setStatusName(String statusName) {
        this.statusName = statusName;
    }

    public Supplier getSupplier() {
        return supplier;
    }

    public void setSupplier(Supplier supplier) {
        this.supplier = supplier;
    }

    public Integer getTradeType() {
        return tradeType;
    }

    public void setTradeType(Integer tradeType) {
        this.tradeType = tradeType;
        switch (tradeType) {
            case StaticVariable.TRADE_TYPE_MOBILE_STOCKIN:
                this.tradeTypeName = StaticVariable.TRADE_TYPE_NAME_MOBILE_STOCKIN;
                break;

            case StaticVariable.TRADE_TYPE_MOBILE_RETURN:
                this.tradeTypeName = StaticVariable.TRADE_TYPE_NAME_MOBILE_RETURN;
                break;
            case StaticVariable.TRADE_TYPE_MOBILE_INSURED:
                this.tradeTypeName = StaticVariable.TRADE_TYPE_NAME_MOBILE_INSURED;
                break;
            case StaticVariable.TRADE_TYPE_MOBILE_EXCHANGE:
                this.tradeTypeName = StaticVariable.TRADE_TYPE_NAME_MOBILE_EXCHANGE;
                break;
            case StaticVariable.TRADE_TYPE_MOBILE_BONUS:
                this.tradeTypeName = StaticVariable.TRADE_TYPE_NAME_MOBILE_BONUS;
                break;
        }
    }

    public String getTradeTypeName() {
        return tradeTypeName;
    }

    public void setTradeTypeName(String tradeTypeName) {
        this.tradeTypeName = tradeTypeName;
    }

    public String getTypeId() {
        return typeId;
    }

    public void setTypeId(String typeId) {
        this.typeId = typeId;
    }

    public Integer getAmount() {
        return amount;
    }

    public void setAmount(Integer amount) {
        this.amount = amount;
    }

    public Double getUnitPrice() {
        return unitPrice;
    }

    public void setUnitPrice(Double unitPrice) {
        this.unitPrice = unitPrice;
    }

    public Date getInputDate() {
        return inputDate;
    }

    public void setInputDate(Date inputDate) {
        this.inputDate = inputDate;
    }

    public String getInputUserId() {
        return inputUserId;
    }

    public void setInputUserId(String inputUserId) {
        this.inputUserId = inputUserId;
    }

    public String getInputUserName() {
        return inputUserName;
    }

    public void setInputUserName(String inputUserName) {
        this.inputUserName = inputUserName;
    }

    public Date getCheckDate() {
        return checkDate;
    }

    public void setCheckDate(Date checkDate) {
        this.checkDate = checkDate;
    }

    public String getCheckUserId() {
        return checkUserId;
    }

    public void setCheckUserId(String checkUserId) {
        this.checkUserId = checkUserId;
    }

    public String getCheckUserName() {
        return checkUserName;
    }

    public void setCheckUserName(String checkUserName) {
        this.checkUserName = checkUserName;
    }

    public Double getTotalMoney() {
        return totalMoney;
    }

    public void setTotalMoney(Double totalMoney) {
        this.totalMoney = totalMoney;
    }

    public Department getDepartment() {
        return department;
    }

    public void setDepartment(Department department) {
        this.department = department;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }


}
