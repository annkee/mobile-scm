package com.ctsig.mobilescm.service.inter.system;

import com.ctsig.mobilescm.domain.system.Role;

import java.util.List;
import java.util.Map;


/**
 *
 */
public interface RoleService {

	/**
	 * 获取角色列表
	 * @param role
	 * @param status
	 * @return
	 */
	List<Role> getRoleList(Role role, Integer[] status);

	/**
	 * 添加角色
	 * @param role
	 */
	void addRole(Role role);

	/**
	 * 编辑角色
	 * @param role
	 */
	void editRole(Role role);

	/**
	 * 删除角色
	 * @param role
	 */
	void deleteRole(Role role);

	/**
	 * 获取某个角色
	 * @param role
	 * @return
	 */
	Role getRole(Role role);
	
	/**
	 * 获取角色权限
	 * @param roleId
	 * @param menu true:获取角色菜单;false:获取角色动作
	 * @return
	 */
	List<Map<String, String>> getRolePrivilege(String roleId, boolean menu);
	
	/**
	 * 更新角色权限
	 * @param roleId
	 * @param menuIds
	 * @param actionIds
	 * @throws Exception 
	 */
	void updateRolePrivilege(String roleId, String[] menuIds, String[] actionIds) throws Exception;

}
