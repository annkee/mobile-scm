package com.ctsig.mobilescm.service.inter.basic;

import com.ctsig.mobilescm.domain.basic.Department;
import com.ctsig.mobilescm.domain.basic.Employee;

import java.util.List;


/**
 * 基础数据
 */
public interface BasicService {

	/**
	 * @param department
	 * @return
	 */
	List<Department> getDepartmentList(Department department);
	
	void addDepartment(Department department);
	
	Department getDepartment(Department department);

	void editDepartment(Department department);

	void deleteDepartmet(Department department);
	
	
	List<Employee> getEmployeeList(Employee employee, List<String> queryScopeList);
	
	Employee getEmployee(Employee employee);
	
	void editEmployee(Employee employee);
	
	void deleteEmployee(Employee employee);
	
	void addEmployee(Employee employee);
	
}
