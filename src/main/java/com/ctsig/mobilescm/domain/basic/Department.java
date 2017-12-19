package com.ctsig.mobilescm.domain.basic;

import java.io.Serializable;

/**
 */
public class Department implements Serializable {
	
	private static final long serialVersionUID = -3613219224005445683L;

	private String id;
	
	private String name;
	
	private String address;
	
	private String phone;
	
	//联系人
	private String linkman;
	
	private String remark;
	
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

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getLinkman() {
		return linkman;
	}

	public void setLinkman(String linkman) {
		this.linkman = linkman;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

}
