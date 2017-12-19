package com.ctsig.mobilescm.domain.basic;

import java.io.Serializable;

/**
 * 供应商类别
 */
public class SupplierType implements Serializable {
	
	private static final long serialVersionUID = -2255000119390543574L;
	
	private String id;
	
	private String name;
	
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

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}
	
	
}
