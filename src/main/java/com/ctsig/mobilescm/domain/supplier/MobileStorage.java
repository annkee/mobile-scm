package com.ctsig.mobilescm.domain.supplier;

import com.ctsig.mobilescm.domain.basic.Department;
import com.ctsig.mobilescm.domain.basic.MobileType;
import com.ctsig.mobilescm.domain.basic.Supplier;

import java.io.Serializable;
import java.util.Date;

/**
 * 手机入库单
 */
public class MobileStorage implements Serializable {
	
	private static final long serialVersionUID = 4043429931422294841L;

	/**
	 * 单号
	 */
	private String id;
	
	private String numberOne;
	
	private String numberTwo;
	
	/**
	 * 供应商
	 */
	private Supplier supplier;
	
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
	 * 进价
	 */
	private Double buyPrice;
	
	/**
	 * 数量
	 */
	private Integer amount;
	
	/**
	 * 总金额
	 */
	private Double totalMoney;
	
	/**
	 * 备注
	 */
	private String remark;
	
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
	 * 审核状态
	 */
	private Integer status = StaticVariable.STATUS_NOTCHECK;
	
	/**
	 * 状态名称
	 */
	private String statusName;
	
	/**
	 * 机构编码
	 */
	private Department department;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

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

	public Double getBuyPrice() {
		return buyPrice;
	}

	public void setBuyPrice(Double buyPrice) {
		this.buyPrice = buyPrice;
	}

	public Integer getAmount() {
		return amount;
	}

	public void setAmount(Integer amount) {
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
