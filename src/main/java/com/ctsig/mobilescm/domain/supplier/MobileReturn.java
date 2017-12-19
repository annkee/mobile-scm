package com.ctsig.mobilescm.domain.supplier;

import com.ctsig.mobilescm.domain.basic.Department;
import com.ctsig.mobilescm.domain.basic.MobileType;
import com.ctsig.mobilescm.domain.basic.Supplier;

import java.io.Serializable;
import java.util.Date;


public class MobileReturn implements Serializable {
	
	private static final long serialVersionUID = 3783087081244351265L;

    private String id;

    /**
     * 供应商
     */
    private Supplier supplier;
    
    /**
     * 手机型号
     */
    private MobileType mobileType;
    
    /**
     * 退货价格
     */
    private Double returnPrice;
    
    /**
     * 数量
     */
    private int amount;

    /**
     * 总价
     */
    private Double totalMoney;

    private String remark;
    
    /**
     * 单据日期
     */
    private Date inputDate;
    
    private String inputUserId;
    private String inputUserName;

    
    private Date checkDate;
    
    private String checkUserId;
    private String checkUserName;

    private Integer status;
    private String statusName;
    
    private Department department;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public Supplier getSupplier() {
		return supplier;
	}

	public void setSupplier(Supplier supplier) {
		this.supplier = supplier;
	}

	public MobileType getMobileType() {
		return mobileType;
	}

	public void setMobileType(MobileType mobileType) {
		this.mobileType = mobileType;
	}

	public Double getReturnPrice() {
		return returnPrice;
	}

	public void setReturnPrice(Double returnPrice) {
		this.returnPrice = returnPrice;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public Double getTotalMoney() {
		return totalMoney;
	}

	public void setTotalMoney(Double totalMoney) {
		this.totalMoney = totalMoney;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
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

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
		switch (status) {
			case StaticVariable.STATUS_NOTCHECK:
				this.statusName = StaticVariable.STATUS_NAME_NOTCHECK;
				break;
	
			case StaticVariable.STATUS_CHECKED:
				this.statusName = StaticVariable.STATUS_NAME_CHECKED;
				break;
		}
	}

	public String getStatusName() {
		return statusName;
	}

	public void setStatusName(String statusName) {
		this.statusName = statusName;
	}

	public Department getDepartment() {
		return department;
	}

	public void setDepartment(Department department) {
		this.department = department;
	}

}