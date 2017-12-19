package com.ctsig.mobilescm.domain.basic;

import java.io.Serializable;

/**
 * 公司/部门账户
 * 如：现金账户、支票账户等
 */
public class Account implements Serializable {
	
	private static final long serialVersionUID = -2660856485572059809L;

	private String id;
	
	/**
	 * 账号
	 */
	private String account;
	
	/**
	 * 账户名称
	 */
	private String name;
	
	/**
	 * 账户余额
	 */
	private Double balance;
	
	private String remark;
	
	/**
	 * 部门ID
	 */
	private Department department;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Double getBalance() {
		return balance;
	}

	public void setBalance(Double balance) {
		this.balance = balance;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public Department getDepartment() {
		return department;
	}

	public void setDepartment(Department department) {
		this.department = department;
	}

	
}
