package com.ctsig.mobilescm.domain.basic;

import java.io.Serializable;

/**
 * 返利类别
 */
public class BonusType implements Serializable {
	
	private static final long serialVersionUID = -1344826529001008460L;

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
