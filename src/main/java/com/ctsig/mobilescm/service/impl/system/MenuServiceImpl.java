package com.ctsig.mobilescm.service.impl.system;

import com.ctsig.mobilescm.dao.system.ActionDao;
import com.ctsig.mobilescm.dao.system.MenuDao;
import com.ctsig.mobilescm.domain.system.Action;
import com.ctsig.mobilescm.domain.system.Menu;
import com.ctsig.mobilescm.domain.system.Role;
import com.ctsig.mobilescm.service.inter.system.MenuService;
import com.ctsig.mobilescm.tool.BaseTool;
import com.ctsig.mobilescm.tool.StringTool;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

@Service
public class MenuServiceImpl implements MenuService {

    private final Logger logger = LoggerFactory.getLogger(MenuServiceImpl.class);
    @Resource
    private MenuDao menuDao;

    @Resource
    private ActionDao actionDao;

    public List<Menu> getMenuTree(String parentId, List<Role> roleList) {
        Map<String, Object> param = new LinkedHashMap<>();
        Menu pMenu = new Menu();
        pMenu.setParentId(parentId);
        param.put("menu", pMenu);
        if (roleList != null && roleList.size() > 0) {
            param.put("roleList", roleList);
        }
        List<Menu> subMenuList = menuDao.getMenuList(param);

        if (subMenuList.size() > 0) {
            for (Menu m : subMenuList) {
                m.setSubMenuList(getMenuTree(m.getId(), roleList));
            }
        }
        return subMenuList;
    }

    public Menu getMenu(Menu menu) {
        return menuDao.getMenu(menu);
    }


    public List<Menu> getMenuList(Menu menu) {
        Map<String, Object> param = new LinkedHashMap<>();
        param.put("menu", menu);
        List<Menu> list = menuDao.getMenuList(param);

        return list;
    }

    public void addMenu(Menu menu) {
        if (StringTool.isEmpty(menu.getId())) {
            //生成ID
            menu.setId(StringTool.uniqueKey());
        }
        if (menu.getType() == Menu.MENU_TYPE_LINE && StringTool.isEmpty(menu.getName())) {
            menu.setName("-- 分隔线 --");
        }
        //保证action不为空，防止在插入时报空指针错误！
        Action action = menu.getAction();
        if (action == null) {
            action = new Action();
            menu.setAction(action);
        }
        if (menu.getType() == Menu.MENU_TYPE_NODE) {
            action.setId(StringTool.uniqueKey());
            action.setType(Action.ACTION_TYPE_NORMAL);
            action.setMenuId(menu.getId());
            action.setRemark("菜单所属动作");

            actionDao.addAction(action);
        } else {
            action.setId(null);
        }
        //排序
        if (menu.getSortOrder() == null) {
            Map<String, Object> param = new LinkedHashMap<>();
            param.put("parentId", menu.getParentId());
            Integer max = menuDao.getMaxSortOrder(param);
            menu.setSortOrder(max == null ? 1 : max + 1);

        }
        menuDao.addMenu(menu);
    }

    public void editMenu(Menu menu) {
        Action action = menu.getAction();
        if (action != null) {
            actionDao.editAction(action);
        }
        menuDao.editMenu(menu);
    }

    public void deleteMenu(Menu menu) {
        if (menu.getAction() != null) {
            Action pA = new Action();
            //删除角色与动作的关联
            pA.setId(menu.getAction().getId());
            actionDao.deleteRoleAction(pA);
            //删除与菜单绑定的Action
            pA.setId(null);
            pA.setMenuId(menu.getId());
            actionDao.deleteAction(pA);
        }

        //删除角色与菜单的关联
        Menu pM = new Menu();
        pM.setId(menu.getId());
        menuDao.deleteRoleMenu(pM);
        //删除子菜单
        pM.setId(null);
        pM.setParentId(menu.getId());
        List<Menu> sub = getMenuList(pM);
        for (Menu m : sub) {
            m = menuDao.getMenu(m);
            deleteMenu(m);
        }
        //删除当前菜单
        menuDao.deleteMenu(menu);
        //更改当前菜单后的排序
        Menu t = new Menu();
        t.setParentId(menu.getParentId());
        t.setSortOrder(menu.getSortOrder());
        List<Menu> menuList = getMenuList(t);
        int order = menu.getSortOrder();
        if (BaseTool.isCollectionNotNull(menuList)) {
            for (Menu m : menuList) {
                m.setSortOrder(m.getSortOrder() - 1);
                menuDao.updateSortOrder(m);
            }
        }
    }

    /**
     * 更新排序
     *
     * @param menu
     * @param up   上移
     */
    public void updateSortOrder(Menu menu, boolean up) {

        if (up) {
            menu.setSortOrder(menu.getSortOrder() - 1);
        } else {
            menu.setSortOrder(menu.getSortOrder() + 1);
        }
        Menu dM = new Menu();
        dM.setParentId(menu.getParentId());
        dM.setSortOrder(menu.getSortOrder());
        dM = menuDao.getMenuBySortOrder(dM);
        if (up) {
            dM.setSortOrder(dM.getSortOrder() + 1);
        } else {
            dM.setSortOrder(dM.getSortOrder() - 1);
        }

        menuDao.updateSortOrder(dM);
        menuDao.updateSortOrder(menu);
    }

}
