package com.ctsig.mobilescm.domain.system;

import java.io.Serializable;
import java.util.LinkedHashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

public class Role implements Serializable {

	private static final long serialVersionUID = -7506684278018095935L;
	
	/**
	 * 角色状态：启用
	 */
	public static final int ROLE_STATUS_ENABLE = 1;
	
	/**
	 * 角色状态：停用
	 */
	public static final int ROLE_STATUS_DISABLE = 2;
	
	/**
	 * 角色状态：删除
	 */
	public static final int ROLE_STATUS_DELETE = 3;
	
	public static final String ROLE_NAME_ENABLE = "启用";
	
	public static final String ROLE_NAME_DISABLE = "禁用";
	
	public static final String ROLE_NAME_DELETE = "删除";
	
	public static final Map<String, Integer> ROLE_STATUS_MAP = new LinkedHashMap<>();
	
	static {
		ROLE_STATUS_MAP.put("ROLE_STATUS_ENABLE", ROLE_STATUS_ENABLE);
		ROLE_STATUS_MAP.put("ROLE_STATUS_DISABLE", ROLE_STATUS_DISABLE);
		ROLE_STATUS_MAP.put("ROLE_STATUS_DELETE", ROLE_STATUS_DELETE);
	}
	
	
	private String id;
	
	private String name;
	
	private Integer status = ROLE_STATUS_ENABLE;
	
	private String statusName;
	
	private String remark;
	
	private List<Menu> menuList = new LinkedList<>();
	
	private List<Action> actionList = new LinkedList<>();
	
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

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		switch (status) {
			case ROLE_STATUS_ENABLE:
				this.statusName = ROLE_NAME_ENABLE;
				break;
			case ROLE_STATUS_DISABLE:
				this.statusName = ROLE_NAME_DISABLE;
				break;
			case ROLE_STATUS_DELETE:
				this.statusName = ROLE_NAME_DELETE;
				break;
		}
		this.status = status;
	}
	
	public String getStatusName() {
		return statusName;
	}

	public void setStatusName(String statusName) {
		this.statusName = statusName;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public List<Menu> getMenuList() {
		return menuList;
	}

	public void setMenuList(List<Menu> menuList) {
		this.menuList = menuList;
	}

	public List<Action> getActionList() {
		return actionList;
	}

	public void setActionList(List<Action> actionList) {
		this.actionList = actionList;
	}
	
	
	
}
