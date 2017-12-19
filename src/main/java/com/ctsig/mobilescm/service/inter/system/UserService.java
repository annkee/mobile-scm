package com.ctsig.mobilescm.service.inter.system;

import com.ctsig.mobilescm.domain.system.User;

import java.util.List;


/**
 *
 */
public interface UserService {
	
	List<User> getUserList(User user);

	void addUser(User user);

	User getUser(User user);

	/**
	 * 
	 * @param user
	 * @param password 为true则修改密码
	 */
	void editUser(User user, boolean password);

	void deleteUser(User user);
	
	
	
}
