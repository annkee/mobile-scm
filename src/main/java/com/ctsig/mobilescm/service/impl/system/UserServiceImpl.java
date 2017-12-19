package com.ctsig.mobilescm.service.impl.system;

import com.ctsig.mobilescm.dao.basic.DepartmentDao;
import com.ctsig.mobilescm.dao.basic.EmployeeDao;
import com.ctsig.mobilescm.dao.system.UserDao;
import com.ctsig.mobilescm.domain.basic.Employee;
import com.ctsig.mobilescm.domain.system.User;
import com.ctsig.mobilescm.service.inter.system.UserService;
import com.ctsig.mobilescm.tool.BaseTool;
import com.ctsig.mobilescm.tool.StringTool;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

/**
 *
 */
@Service
public class UserServiceImpl implements UserService {

	@Resource
	private UserDao userDao;
	
	@Resource
	private EmployeeDao employeeDao;
	
	@Resource
	private DepartmentDao departmentDao;
	
	public List<User> getUserList(User user) {
		Map<String, Object> param = new LinkedHashMap<>();
		if(user != null){
			if(StringTool.isNotEmpty(user.getAccount())){
				param.put("account", "%"+user.getAccount()+"%");
			}
			if(StringTool.isNotEmpty(user.getId())){
				param.put("id", user.getId());
			}
		}
		List<User> userList = userDao.getUserList(param);
		if(BaseTool.isCollectionNotNull(userList)){
			for(User u : userList){
				Map<String, Object> dept = new LinkedHashMap<>();
				dept.put("ids", u.getQueryScopeList());
				u.setDepartmentList(departmentDao.getDepartmentList(dept));
			}
		}
		return userList;
	}
	
	public User getUser(User user) {
		List<User> userList = getUserList(user);
		if(BaseTool.isCollectionNotNull(userList)){
			return userList.get(0);
		}
		return null;
	}
	
	public void addUser(User user) {
		//生成主键
		String userId = StringTool.uniqueKey();
		user.setId(userId);
		//设置时间
		user.setCreateTime(new Date());
		//使用MD5将密码加密
		user.setPassword(BaseTool.MD5Encoder("111111"));
		//添加用户
		userDao.addUser(user);
		
		//添加用户与角色的关联
		if(BaseTool.isCollectionNotNull(user.getRoleIdList())){
			Map<String, Object> param = new LinkedHashMap<>();
			Map<String, String> id_role = new LinkedHashMap<>();
			for(String roleId : user.getRoleIdList()){
				String id = StringTool.uniqueKey();
				id_role.put(id, roleId);
			}
			param.put("userId", userId);
			param.put("id_role", id_role);
			userDao.addUserRole(param);
		}
		
		//添加用户与员工的关联
		Employee employee = user.getEmployee();
		employee.setUser(user);
		employeeDao.editEmployee(employee);
	}

	
	public void editUser(User user, boolean password) {
		if(password){
			user.setPassword(BaseTool.MD5Encoder(user.getPassword()));
		} else{
			//更新用户与角色的关联
			userDao.deleteUserRole(user.getId());
			if(BaseTool.isCollectionNotNull(user.getRoleIdList())){
				Map<String, Object> param = new LinkedHashMap<>();
				Map<String, String> id_role = new LinkedHashMap<>();
				for(String roleId : user.getRoleIdList()){
					String id = StringTool.uniqueKey();
					id_role.put(id, roleId);
				}
				param.put("userId", user.getId());
				param.put("id_role", id_role);
				userDao.addUserRole(param);
			}
		}
		
		//更新用户
		userDao.editUser(user);
	}

	public void deleteUser(User user) {
		//删除用户和角色的关联
		userDao.deleteUserRole(user.getId());
		//删除用户和员工的关联
		Employee employee = user.getEmployee();
		employee.setUser(new User());
		employeeDao.editEmployee(employee);
		//删除用户
		userDao.deleteUser(user.getId());
	}

	
	
	
}
