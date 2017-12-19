package com.ctsig.mobilescm.domain.system;

import java.io.Serializable;

public class Action implements Serializable {
	
	private static final long serialVersionUID = 4384934413474699609L;
	
	/**
	 * 动作类型：普通动作
	 */
	public static final int ACTION_TYPE_NORMAL = 1;
	
	/**
	 * 动作类型：授权动作
	 */
	public static final int ACTION_TYPE_AUTHOR = 2;
	
	public static final String ACTION_NAME_NORMAL = "普通动作";
	
	public static final String ACTION_NAME_AUTHOR = "授权动作";
	
	private String id;
	
	private String name;
	
	private Integer type;
	
	private String typeName;
	
	private String menuId;
	
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
	
	public Integer getType() {
		return type;
	}

	public void setType(Integer type) {
		this.type = type;
		switch (type) {
		case ACTION_TYPE_NORMAL:
			this.typeName = ACTION_NAME_NORMAL;
			break;
		case ACTION_TYPE_AUTHOR:
			this.typeName = ACTION_NAME_AUTHOR;
			break;
		}
	}
	
	public String getTypeName() {
		return typeName;
	}

	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}

	public String getMenuId() {
		return menuId;
	}

	public void setMenuId(String menuId) {
		this.menuId = menuId;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}
	
	
}
