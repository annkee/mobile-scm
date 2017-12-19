package com.ctsig.mobilescm.domain.basic;

import java.io.Serializable;

/**
 * 客户
 */
public class Customer implements Serializable {

	private static final long serialVersionUID = 2538311216166618598L;
	
	private String id;
	
	/**
	 * 客户名称
	 */
	private String name;
	
	/**
	 * 联系人
	 */
	private String linkMan;
	
	private String phone;
	
	private String email;
	
	private String address;
	
	/**
	 * 传真
	 */
	private String fax;
	
	private String remark;
	
	/**
	 * 客户类别
	 */
	private CustomerType customerType;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getLinkMan() {
		return linkMan;
	}

	public void setLinkMan(String linkMan) {
		this.linkMan = linkMan;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getFax() {
		return fax;
	}

	public void setFax(String fax) {
		this.fax = fax;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public CustomerType getCustomerType() {
		return customerType;
	}

	public void setCustomerType(CustomerType customerType) {
		this.customerType = customerType;
	}
	
}
