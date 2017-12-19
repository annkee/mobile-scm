package com.ctsig.mobilescm.domain.basic;

import com.ctsig.mobilescm.domain.system.User;

import java.io.Serializable;
import java.util.LinkedHashMap;
import java.util.Map;



/**
 *
 */
public class Employee implements Serializable {
	
	private static final long serialVersionUID = 3918113345866285718L;

	public static final int EMPLOYEE_TYPE_SALESMAN = 1;
	public static final int EMPLOYEE_TYPE_OTHER = 2;
	
	public static final String EMPLOYEE_NAME_SALESMAN = "销售员";
	public static final String EMPLOYEE_NAME_OTHER = "其它";
	
	public static final Map<Integer, String> EMPLOYEE_TYPE_MAP = new LinkedHashMap<>();
	static {
		EMPLOYEE_TYPE_MAP.put(EMPLOYEE_TYPE_SALESMAN, EMPLOYEE_NAME_SALESMAN);
		EMPLOYEE_TYPE_MAP.put(EMPLOYEE_TYPE_OTHER, EMPLOYEE_NAME_OTHER);
	}
	
	private String id;
	
	private String name;
	
	private String phone;
	
	private Integer type;
	
	private String typeName;
	
	private String remark;
	
	/**
	 * 可以为空：用户中可能会有员工，但有些员工不一定是系统用户。
	 */
	private User user;
	
	private Department department;

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

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public Integer getType() {
		return type;
	}

	public void setType(Integer type) {
		this.type = type;
		switch (type) {
			case EMPLOYEE_TYPE_SALESMAN:
				this.typeName = EMPLOYEE_NAME_SALESMAN;
				break;
			case EMPLOYEE_TYPE_OTHER:
				this.typeName = EMPLOYEE_NAME_OTHER;
				break;
		}
	}
	
	public String getTypeName() {
		return typeName;
	}

	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Department getDepartment() {
		return department;
	}

	public void setDepartment(Department department) {
		this.department = department;
	}
	
	
}	
