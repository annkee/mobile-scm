package com.ctsig.mobilescm.domain.system;


import com.ctsig.mobilescm.domain.basic.Department;
import com.ctsig.mobilescm.domain.basic.Employee;
import com.ctsig.mobilescm.tool.StringTool;
import com.ctsig.mobilescm.tool.TimeTool;

import java.io.Serializable;
import java.util.*;

public class User implements Serializable {
	
	private static final long serialVersionUID = 1690567681833724813L;
	
	public static final int USER_STATUS_ENABLE = 1;
	public static final int USER_STATUS_DISABLE = 2;
	public static final int USER_STATUS_DELETE = 3;
	
	public static final String USER_NAME_ENABLE = "启用";
	public static final String USER_NAME_DISABLE = "禁用";
	public static final String USER_NAME_DELETE = "删除";
	
	public static final Map<Integer, String> USER_STATUS_MAP = new LinkedHashMap<>();
	static {
		USER_STATUS_MAP.put(USER_STATUS_ENABLE, USER_NAME_ENABLE);
		USER_STATUS_MAP.put(USER_STATUS_DISABLE, USER_NAME_DISABLE);
		USER_STATUS_MAP.put(USER_STATUS_DELETE, USER_NAME_DELETE);
	}
	
	private String id;
	
	private String account;
	
	private String password;

	private Integer status;
	
	private String statusName;
	
	private String remark;
	
	private Date createTime;
	
	private String createTimeStr;
	
	private String skin = "default";
	//如果用户和员工对应的话则有该属性
	private Employee employee;
	
	//查询范围
	private String queryScope;
	
	//查询范围的集合
	private List<String> queryScopeList;
	
	//查询范围关联的部门
	private List<Department> departmentList;
	
	private List<Role> roleList = new LinkedList<>();
	
	private List<String> roleIdList;
	
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

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
		switch (status) {
		case USER_STATUS_ENABLE:
			this.statusName = USER_NAME_ENABLE;
			break;
		case USER_STATUS_DISABLE:
			this.statusName = USER_NAME_DISABLE;
			break;
		case USER_STATUS_DELETE:
			this.statusName = USER_NAME_DELETE;
			break;
		}
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

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
		this.createTimeStr = TimeTool.formatDate(createTime, null);
	}

	public String getCreateTimeStr() {
		return createTimeStr;
	}

	public void setCreateTimeStr(String createTimeStr) {
		this.createTimeStr = createTimeStr;
	}

	public String getSkin() {
		return skin;
	}

	public void setSkin(String skin) {
		this.skin = skin;
	}

	public Employee getEmployee() {
		return employee;
	}
	
	public void setEmployee(Employee employee) {
		this.employee = employee;
	}

	public String getQueryScope() {
		return queryScope;
	}

	public void setQueryScope(String queryScope) {
		this.queryScope = queryScope;
		if(!StringTool.isEmpty(queryScope)){
			String[] tmp = queryScope.split(",");
			this.queryScopeList = Arrays.asList(tmp);
		}
	}

	public List<String> getQueryScopeList() {
		return queryScopeList;
	}

	public void setQueryScopeList(List<String> queryScopeList) {
		this.queryScopeList = queryScopeList;
		//StringBuilder速度更快，但是线程不安全的。SringBuffer是线程安全的，速度相比较慢。此处线程安全。
//		StringBuffer sb = new StringBuffer();
		StringBuilder sb = new StringBuilder();
		if(queryScopeList != null && queryScopeList.size() > 0){
			for(String qs : queryScopeList){
				sb.append(qs);
				sb.append(",");
			}
		}
		sb.deleteCharAt(sb.length()-1);
		this.queryScope = sb.toString();
	}

	public List<Department> getDepartmentList() {
		return departmentList;
	}

	public void setDepartmentList(List<Department> departmentList) {
		this.departmentList = departmentList;
	}

	public List<Role> getRoleList() {
		return roleList;
	}

	public void setRoleList(List<Role> roleList) {
		this.roleList = roleList;
		if(roleList != null && roleList.size() > 0){
			this.roleIdList = new ArrayList<>();
			for(Role role : roleList){
				this.roleIdList.add(role.getId());
			}
		}
	}

	public List<String> getRoleIdList() {
		return roleIdList;
	}

	public void setRoleIdList(List<String> roleIdList) {
		this.roleIdList = roleIdList;
	}
	
}
