package com.ctsig.mobilescm.dao.system;

import com.ctsig.mobilescm.domain.system.Action;
import org.apache.ibatis.annotations.Param;

import java.util.List;


/**
 *
 */
public interface ActionDao {

    /**
     * 查询Action
     *
     * @param action 查询条件
     * @return
     */
    Action getAction(@Param("action") Action action);

    /**
     * 根据特定条件查询action集合
     *
     * @param action
     * @return
     */
    List<Action> getActionList(@Param("action") Action action);

    /**
     * 添加Action
     *
     * @param action
     */
    void addAction(@Param("action") Action action);

    /**
     * 编辑action
     *
     * @param action
     */
    void editAction(@Param("action") Action action);

    /**
     * 删除action
     *
     * @param action
     */
    void deleteAction(@Param("action") Action action);

    /**
     * 删除角色与动作的关联
     *
     * @param action
     */
    void deleteRoleAction(@Param("action") Action action);

}
