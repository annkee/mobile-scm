package com.ctsig.mobilescm.service.impl.system;

import com.ctsig.mobilescm.dao.system.RoleDao;
import com.ctsig.mobilescm.domain.system.Role;
import com.ctsig.mobilescm.service.inter.system.RoleService;
import com.ctsig.mobilescm.tool.StringTool;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

/**
 *
 */
@Service
public class RoleServiceImpl implements RoleService {
	
	@Resource
	private RoleDao roleDao;
	
	public List<Role> getRoleList(Role role, Integer[] status) {
		Map<String, Object> param = new LinkedHashMap<>();
		if(status == null){
			status = new Integer[]{Role.ROLE_STATUS_ENABLE, Role.ROLE_STATUS_DISABLE};
		}
		param.put("status", status);
		if(role != null && !StringTool.isEmpty(role.getName())){
			param.put("name", "%"+role.getName()+"%");
		}
		return roleDao.getRoleList(param);
	}
	
	public void addRole(Role role) {
		role.setId(StringTool.uniqueKey());
		roleDao.addRole(role);
	}

	public void editRole(Role role) {
		roleDao.editRole(role);
	}

	public void deleteRole(Role role) {
		role.setStatus(Role.ROLE_STATUS_DELETE);
		roleDao.editRole(role);
	}

	@Override
	public Role getRole(Role role) {
		
		return roleDao.getRole(role);
	}

	public List<Map<String, String>> getRolePrivilege(String roleId, boolean menu) {
		Map<String, Object> param = new LinkedHashMap<>();
		param.put("roleId", roleId);
		if(menu){
			param.put("table", "sys_role_menu");
		} else{
			param.put("table", "sys_role_action");
		}
		List<Map<String, String>> roleAction = roleDao.getRolePrivilege(param);
		
		return roleAction;
	}

	public void updateRolePrivilege(String roleId, String[] menuIds, String[] actionIds) throws Exception {
		Map<String, Object> param = new LinkedHashMap<>();
		param.put("roleId", roleId);
		//删除关联的菜单
		param.put("table", "sys_role_menu");
		roleDao.deleteRolePrivilege(param);
		//添加菜单关联
		Map<String, String> pMap = new HashMap<>();
		if(menuIds != null && menuIds.length > 0){
			for(String mid : menuIds){
				pMap.put(StringTool.uniqueKey(), mid);
			}
			param.put("pMap", pMap);
			roleDao.addRolePrivilegeBatch(param);
		}
		
		pMap.clear();
		//删除关联的动作
		param.put("table", "sys_role_action");
		roleDao.deleteRolePrivilege(param);
		//添加动作关联
		if(actionIds != null && actionIds.length > 0){
			for(String aid : actionIds){
				pMap.put(StringTool.uniqueKey(), aid);
			}
			param.put("menuMap", pMap);
			roleDao.addRolePrivilegeBatch(param);
		}
		
	}

	
	
}
