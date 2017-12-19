package com.ctsig.mobilescm.service.inter.system;

import com.ctsig.mobilescm.domain.system.Action;

import java.util.List;


/**
 *
 */
public interface ActionService {
	
	/**
	 * 查询Action集合
	 * @param action
	 * @return
	 */
	List<Action> getActionList(Action action);
	
	/**
	 * 获取Action
	 * @param action
	 * @return
	 */
	Action getAction(Action action);
	
	/**
	 * 编辑Action
	 * @param action
	 */
	void editAction(Action action);
	
	/**
	 * 删除Action
	 * @param action
	 */
	void deleteAction(Action action);

	/**
	 * 添加动作
	 * @param action
	 */
	void addAction(Action action);
	
}
