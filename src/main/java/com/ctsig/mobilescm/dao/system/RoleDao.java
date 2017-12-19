package com.ctsig.mobilescm.dao.system;

import com.ctsig.mobilescm.domain.system.Role;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;
import java.util.Set;


/**
 *
 */
public interface RoleDao {

    /**
     * 查询角色
     *
     * @param role
     * @return
     */
    Role getRole(@Param("role") Role role);

    /**
     * 查询角色集合
     *
     * @param param
     * @return
     */
    List<Role> getRoleList(@Param("param") Map<String, Object> param);

    /**
     * 添加角色
     *
     * @param role
     */
    void addRole(@Param("role") Role role);

    /**
     * 编辑角色
     *
     * @param role
     */
    void editRole(@Param("role") Role role);

    /**
     * 删除角色
     *
     * @param role
     */
    void deleteRole(@Param("role") Role role);

    /**
     * 获取角色相关权限
     *
     * @return
     */
    List<Map<String, String>> getRolePrivilege(@Param("param") Map<String, Object> param);

    /**
     * 删除角色权限
     *
     * @param param 需传入角色ID和查询的表
     */
    void deleteRolePrivilege(@Param("param") Map<String, Object> param);

    /**
     * 批量添加角色权限
     */
    void addRolePrivilegeBatch(@Param("param") Map<String, Object> param);

    /**
     * 获取用户对应的动作列表
     *
     * @param roleIdList
     */
    Set<String> getUserActionList(@Param("roleIdList") List<String> roleIdList);


}

