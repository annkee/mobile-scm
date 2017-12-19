package com.ctsig.mobilescm.service.impl.basic;

import com.ctsig.mobilescm.dao.basic.DepartmentDao;
import com.ctsig.mobilescm.dao.basic.EmployeeDao;
import com.ctsig.mobilescm.domain.basic.Department;
import com.ctsig.mobilescm.domain.basic.Employee;
import com.ctsig.mobilescm.service.inter.basic.BasicService;
import com.ctsig.mobilescm.tool.BaseTool;
import com.ctsig.mobilescm.tool.StringTool;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;


/**
 * 基础数据
 */
@Service
public class BasicServiceImpl implements BasicService {
	
	@Resource
	private DepartmentDao departmentDao;
	
	@Resource
	private EmployeeDao employeeDao;

	public List<Department> getDepartmentList(Department department) {
		Map<String, Object> param = new LinkedHashMap<>();
		if(department != null){
			if(!StringTool.isEmpty(department.getName())){
				param.put("name", "%"+department.getName()+"%");
			}
			if(!StringTool.isEmpty(department.getAddress())){
				param.put("address", "%"+department.getAddress()+"%");
			}
		}
		return departmentDao.getDepartmentList(param);
	}

	public void addDepartment(Department department) {
		department.setId(StringTool.uniqueKey());
		departmentDao.addDepartment(department);
	}

	public Department getDepartment(Department department) {
		
		return departmentDao.getDepartment(department);
	}

	public void editDepartment(Department department) {
		departmentDao.editDepartment(department);
	}

	public void deleteDepartmet(Department department) {
		//将该部门下的员工的部门编号清空
		departmentDao.deleteDeptEmp(department);
		//删除部门
		departmentDao.deleteDepartment(department);
	}

	public List<Employee> getEmployeeList(Employee employee, List<String> queryScopeList) {
		Map<String, Object> param = new LinkedHashMap<>();
		if(employee != null && StringTool.isNotEmpty(employee.getId())){
			param.put("id", employee.getId());
		}
		if(employee != null && StringTool.isNotEmpty(employee.getName())){
			param.put("name", "%"+employee.getName()+"%");
		}
		if(BaseTool.isCollectionNotNull(queryScopeList)){
			param.put("queryScopeList", queryScopeList);
		}
		return employeeDao.getEmployeeList(param);
	}
	
	public Employee getEmployee(Employee employee) {
		
		List<Employee> list = getEmployeeList(employee, null);
		if(BaseTool.isCollectionNotNull(list)){
			return list.get(0);
		}
		return null;
	}

	public void editEmployee(Employee employee) {
		employeeDao.editEmployee(employee);
	}

	public void deleteEmployee(Employee employee) {
		//删除用户
		
		//删除员工
		employeeDao.deleteEmployee(employee);
	}

	public void addEmployee(Employee employee) {
		employee.setId(StringTool.uniqueKey());
		employeeDao.addEmployee(employee);
	}
	
	
	
	
	
}
