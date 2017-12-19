package com.ctsig.mobilescm.service.inter.system;

import com.ctsig.mobilescm.domain.system.Menu;
import com.ctsig.mobilescm.domain.system.Role;

import java.util.List;


/**
 * 
 */
public interface MenuService {
	
	
	/**
	 * 生成菜单树
	 * @param parentId
	 * @param roleList
	 * @return
	 */
	List<Menu> getMenuTree(String parentId, List<Role> roleList);
	
	/**
	 * 
	 * @param menu
	 * @return
	 */
	Menu getMenu(Menu menu);
	
	/**
	 * 根据特定条件查询菜单
	 * @param menu
	 * @return
	 */
	List<Menu> getMenuList(Menu menu);
	
	/**
	 * 添加菜单
	 * @param menu
	 */
	void addMenu(Menu menu);

	/**
	 * 编辑菜单
	 * @param menu
	 */
	void editMenu(Menu menu);

	/**
	 * 删除菜单
	 * @param menu
	 */
	void deleteMenu(Menu menu);

	/**
	 * 移动菜单
	 * @param menu
	 */
	void updateSortOrder(Menu menu, boolean up);
	
	
	
}
