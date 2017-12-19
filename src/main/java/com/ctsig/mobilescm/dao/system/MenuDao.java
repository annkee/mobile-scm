package com.ctsig.mobilescm.dao.system;

import com.ctsig.mobilescm.domain.system.Menu;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;


public interface MenuDao {

    /**
     * @param menu
     * @return
     */
    Menu getMenu(@Param("menu") Menu menu);

    /**
     * 查询菜单的子菜单集合
     *
     * @param param
     * @return
     */
    List<Menu> getMenuList(@Param("param") Map<String, Object> param);

    /**
     * 添加菜单
     *
     * @param menu
     */
    void addMenu(@Param("menu") Menu menu);

    /**
     * 排序最大值
     *
     * @param param
     * @return
     */
    Integer getMaxSortOrder(@Param("param") Map<String, Object> param);

    /**
     * 编辑菜单
     *
     * @param menu
     */
    void editMenu(@Param("menu") Menu menu);

    /**
     * 删除菜单
     *
     * @param menu
     */
    void deleteMenu(@Param("menu") Menu menu);

    /**
     * 删除角色与菜单的关联
     *
     * @param menu
     */
    void deleteRoleMenu(@Param("menu") Menu menu);

    /**
     * 通过parentId和sortOrder查询菜单
     *
     * @param menu
     */
    Menu getMenuBySortOrder(@Param("menu") Menu menu);

    /**
     * 更新菜单排序
     *
     * @param menu
     */
    void updateSortOrder(@Param("menu") Menu menu);
}
