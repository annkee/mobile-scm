package com.ctsig.mobilescm.domain.basic;

import java.io.Serializable;

/**
 * 供应商
 */
public class Supplier implements Serializable {
	
	private static final long serialVersionUID = -892561024982718703L;

	private String id;
	
	/**
	 * 供应商名称
	 */
	private String name;
	
	/**
	 * 联系人
	 */
	private String linkMan;
	
	private String phone;
	
	private String email;
	
	private String address;
	
	private String remark;
	
	/**
	 * 供应商类别ID
	 */
	private SupplierType supplierType;

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

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public SupplierType getSupplierType() {
		return supplierType;
	}

	public void setSupplierType(SupplierType supplierType) {
		this.supplierType = supplierType;
	}

}
