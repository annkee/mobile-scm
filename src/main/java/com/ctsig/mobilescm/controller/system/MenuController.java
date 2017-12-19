package com.ctsig.mobilescm.controller.system;

import com.alibaba.fastjson.JSONObject;
import com.ctsig.mobilescm.domain.system.Action;
import com.ctsig.mobilescm.domain.system.Menu;
import com.ctsig.mobilescm.domain.system.Role;
import com.ctsig.mobilescm.domain.system.User;
import com.ctsig.mobilescm.service.inter.system.ActionService;
import com.ctsig.mobilescm.service.inter.system.MenuService;
import com.ctsig.mobilescm.tool.StringTool;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import java.util.Map;


/**
 * 菜单管理
 */
@Controller
@RequestMapping("/menu")
public class MenuController extends BaseController {

    private static final long serialVersionUID = 7859118960658858971L;

    private final Logger logger = LoggerFactory.getLogger(MenuController.class);

    @Resource
    private MenuService menuService;

    @Resource
    private ActionService actionService;

    private Action action;

    /**
     * 前台传参数
     */
    private Menu menu;
    /**
     * 子菜单
     */
    private List<Menu> subMenuList;

    private Map<Integer, String> menuTypeMap = Menu.MENU_TYPE_MAP;


    /**
     * 刷新菜单树
     */
    private boolean refreshTree;

  /*  public List<Menu> getSubMenuList() {
        return subMenuList;
    }

    public Map<Integer, String> getMenuTypeMap() {
        return menuTypeMap;
    }


    public boolean getRefreshTree() {
        return refreshTree;
    }

    public void setRefreshTree(boolean refreshTree) {
        this.refreshTree = refreshTree;
    }

*/
    /**
     * 生成菜单树
     *
     * @return
     */
    @RequestMapping("/menuTree")
    public void menuTree(@RequestParam("time") String time, @ModelAttribute(value = "menu") Menu menu,
                         HttpServletRequest request, HttpServletResponse response) {

        //根菜单
        Menu menuTree = menu;
        menuTree.setId("root");
        //查询根菜单详细
        menuTree = menuService.getMenu(menuTree);
        //获取当前用户
        User loginUser = (User) request.getSession().getAttribute("loginUser");
        List<Role> roleList = loginUser.getRoleList();
        //查询设置菜单树
        menuTree.setSubMenuList(menuService.getMenuTree(menuTree.getId(), roleList));
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("menuTree", menuTree);
        try {
            response.getWriter().write(jsonObject.toString());
        } catch (IOException e) {
            e.printStackTrace();
        }

    }

    @RequestMapping("/toMenuTreeView")
    public String toMenuTreeView() {

        return "dev/menu_manage";
    }

    /**
     * 菜单详细
     *
     * @return
     */
    @RequestMapping("/menuDetail")
    public String menuDetail(@RequestParam(value = "menuId") String menuId, @RequestParam(value = "menuType", required = false) String menuType,
                             @RequestParam(value = "refreshTree", required = false) String refreshTree, Model model, HttpServletRequest request) {
        menu = new Menu();
        menu.setId(menuId);

        menu.setType(menuType != null ? Integer.parseInt(menuType) : null);
        menu = menuService.getMenu(menu);
        //查询父菜单

        if (!StringTool.isEmpty(menu == null ? null : menu.getParentId())) {
            Menu parentMenu = new Menu();
            parentMenu.setId(menu.getParentId());
            parentMenu = menuService.getMenu(parentMenu);
            request.getSession().setAttribute("parentMenu", parentMenu);
        }
        //如果为父菜单则查询其子菜单
        if (Menu.MENU_TYPE_PARENT == menu.getType()) {
            Menu paramMenu = new Menu();
            paramMenu.setParentId(menuId);
            subMenuList = menuService.getMenuList(paramMenu);
        }
        //如果为节点则查询动作列表
        if (Menu.MENU_TYPE_NODE == menu.getType() && menu.getAction() != null) {
            Action paramAction = new Action();
            paramAction.setMenuId(menuId);
            paramAction.setType(menu.getAction().getType());
            if (menu.getAction().getType() == Action.ACTION_TYPE_NORMAL) {
                List<Action> normalActionList = actionService.getActionList(paramAction);
                model.addAttribute("normalActionList", normalActionList);
            }
            if (menu.getAction().getType() == Action.ACTION_TYPE_AUTHOR) {
                List<Action> authorActionList = actionService.getActionList(paramAction);
                model.addAttribute("authorActionList", authorActionList);
            }
        }
        model.addAttribute("menu", menu);
        model.addAttribute("subMenuList", subMenuList);
        request.getSession().setAttribute("refreshTree", refreshTree);

        return "dev/menu_detail";
    }

    /**
     * 转到添加菜单页面
     *
     * @return
     */

    @RequestMapping("/toAddMenuView")
    public String toAddMenuView(@RequestParam("menuId") String menuId, HttpServletRequest request, Model model) {
        menu.setId(menuId);
        menu = menuService.getMenu(menu);
        request.getSession().setAttribute("menuTypeMap", menuTypeMap);
        model.addAttribute("menu", menu);

        return "dev/menu_add";
    }

    /**
     * 添加菜单
     * menu_menuDetail.action?menu.id=${menu.parentId}&refreshTree=${refreshTree}
     * 此处处理post的表单获取
     *
     * @return
     */
    @RequestMapping(value = "/addMenu", method = RequestMethod.POST)
    public void addMenu(@RequestBody JSONObject jsonObject, Model model, HttpServletResponse response) {

        String menuParentId = jsonObject.getString("menuParentId");
        String menuName = jsonObject.getString("menuName");
        String menuType = jsonObject.getString("menuType");
        String menuActionName = jsonObject.getString("menuActionName");
        String menuRemark = jsonObject.getString("menuRemark");
        menu.setId(null);
        menu.setParentId(menuParentId);
        menu.setName(menuName);
        menu.setType(Integer.parseInt(menuType));
        Action action = new Action();
        action.setName(menuActionName);
        menu.setAction(action);
        menu.setRemark(menuRemark);
        model.addAttribute("menu", menu);
        menuService.addMenu(menu);
        refreshTree = true;
        String returnData = "/menu/menuDetail?menuId=" + menu.getParentId() + "&menuType=" + menu.getType() + "&refreshTree=" + refreshTree;
        jsonObject.put("msg", returnData);

        try {
            response.getWriter().write(jsonObject.toString());
        } catch (IOException e) {
            e.printStackTrace();
        }

    }

    /**
     * 转到编辑菜单页面
     *
     * @return
     */
    @RequestMapping("/toEditMenuView")
    public String toEditMenuView(@RequestParam("menuId") String menuId, HttpServletRequest request, Model model) {
        menu.setId(menuId);
        menu = menuService.getMenu(menu);
        request.getSession().setAttribute("menuTypeMap", menuTypeMap);
        model.addAttribute("menu", menu);
        //查询父菜单
        if (!StringTool.isEmpty(menu.getParentId())) {
            Menu parentMenu = new Menu();
            parentMenu.setId(menu.getParentId());
            parentMenu = menuService.getMenu(parentMenu);
        }

        return "dev/menu_edit";
    }

    /**
     * 编辑菜单
     *
     * @return
     */
    @RequestMapping(value = "/editMenu", method = RequestMethod.POST)
    public void editMenu(@RequestBody JSONObject jsonObject, Model model, HttpServletResponse response) {
        String menuId = jsonObject.getString("menuId");
        String menuParentId = jsonObject.getString("menuParentId");
        String menuName = jsonObject.getString("menuName");
        String menuType = jsonObject.getString("menuType");
        String menuActionId = jsonObject.getString("menuActionId");
        String menuActionName = jsonObject.getString("menuActionName");
        String menuRemark = jsonObject.getString("menuRemark");
        menu.setId(menuId);
        menu.setParentId(menuParentId);
        menu.setName(menuName);
        menu.setType(Integer.parseInt(menuType));
        menu.setRemark(menuRemark);
        Action action = new Action();

        action.setName(menuActionName);
        action.setId(menuActionId);
        menu.setAction(action);

        menuService.editMenu(menu);
        refreshTree = true;
        String returnData = "/menu/menuDetail?menuId=" + menu.getId() + "&menuType=" + menu.getType() + "&refreshTree=" + refreshTree;
        jsonObject.put("msg", returnData);
        try {
            response.getWriter().write(jsonObject.toString());
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    /**
     * 删除菜单
     *
     * @return
     */
    @RequestMapping("/deleteMenu")
    public String deleteMenu(@RequestParam("menuId") String menuId, RedirectAttributes redirect) {
        menu.setId(menuId);
        menu = menuService.getMenu(menu);

        menuService.deleteMenu(menu);

        refreshTree = true;
        redirect.addAttribute("menuId", menu.getParentId());
        redirect.addAttribute("refreshTree", refreshTree);
        return "redirect:/menu/menuDetail";
    }

    /**
     * 转到添加动作页面
     *
     * @return
     */
    @RequestMapping("/toAddActionView")
    public String toAddActionView(@RequestParam("menuId") String menuId, HttpServletRequest request, Model model) {

        menu.setId(menuId);
        menu = menuService.getMenu(menu);
        request.getSession().setAttribute("menuTypeMap", menuTypeMap);
        model.addAttribute("menu", menu);
        return "dev/action_add";

    }

    /**
     * 添加动作
     *
     * @return
     */
    @RequestMapping(value = "/addAction", method = RequestMethod.POST)
    public void addAction(@RequestBody JSONObject jsonObject, Model model, HttpServletResponse response) {
        String actionMenuId = jsonObject.getString("actionMenuId");
        String actionName = jsonObject.getString("actionName");
        String actionType = jsonObject.getString("actionType");
        String actionRemark = jsonObject.getString("actionRemark");
        //添加action
        action = new Action();
        action.setMenuId(actionMenuId);
        action.setName(actionName);
        action.setType(Integer.parseInt(actionType));
        action.setRemark(actionRemark);
        action.setId(StringTool.uniqueKey());
        actionService.addAction(action);

        //修改菜单的actionId
        Integer type = menu.getType();
        menu = new Menu();
        menu.setId(action.getMenuId());
        menu.setAction(action);
        menuService.editMenu(menu);

        String returnData = "/menu/menuDetail?menuId=" + action.getMenuId() + "&menuType=" + type;
        jsonObject.put("msg", returnData);
        try {
            response.getWriter().write(jsonObject.toString());
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    /**
     * 转到编辑Action页面
     *
     * @return
     */
    @RequestMapping("/toEditActionView")
    public String toEditActionView(@RequestParam("actionId") String actionId, @RequestParam(value = "menuId", required = false) String menuId,
                                   Model model) {

        action = menu.getAction();
        action.setId(actionId);
        menu.setAction(action);
        if (menuId != null) {
            menu.setId(menuId);
        }

        menu = menuService.getMenu(menu);
        action = actionService.getAction(action);
        model.addAttribute("menu", menu);
        model.addAttribute("action", action);

        return "dev/action_edit";
    }

    /**
     * 编辑Action
     *
     * @return
     */
    @RequestMapping(value = "/editAction", method = RequestMethod.POST)
    public void editAction(@RequestBody JSONObject jsonObject, Model model, HttpServletResponse response) {
        String menuId = jsonObject.getString("menuId");
        String actionName = jsonObject.getString("actionName");
        String actionId = jsonObject.getString("actionId");
        String actionMenuId = jsonObject.getString("actionMenuId");
        String actionType = jsonObject.getString("actionType");
        String actionRemark = jsonObject.getString("actionRemark");
        menu.setId(menuId);
        action.setId(actionId);
        action.setName(actionName);
        action.setMenuId(actionMenuId);
        action.setType(Integer.parseInt(actionType));
        action.setRemark(actionRemark);
        actionService.editAction(action);
        String returnData = "/menu/menuDetail?menuId=" + menuId + "&menuType=" + menu.getType();
        jsonObject.put("msg", returnData);
        try {
            response.getWriter().write(jsonObject.toString());
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    /**
     * 删除Action
     *
     * @return
     */
    @RequestMapping("/deleteAction")
    public String deleteAction(@RequestParam("actionId") String actionId, @RequestParam(value = "menuId", required = false) String menuId, RedirectAttributes redirect) {
        action = new Action();
        action.setId(actionId);
        action.setMenuId(menuId);
        actionService.deleteAction(action);
        redirect.addAttribute("menuId", menu.getId());
        return "redirect:/menu/menuDetail";
    }

    /**
     * 上移
     *
     * @return
     */
    @RequestMapping("/moveUp")
    public String moveUp(@RequestParam("menuId") String menuId, @RequestParam("menuParentId") String menuParentId,
                         @RequestParam("menuSortOrder") String menuSortOrder, RedirectAttributes redirect) {
        menu.setId(menuId);
        menu.setParentId(menuParentId);
        menu.setSortOrder(Integer.parseInt(menuSortOrder));
        menuService.updateSortOrder(menu, true);

        refreshTree = true;

        redirect.addAttribute("menuId", menuParentId);
        redirect.addAttribute("refreshTree", refreshTree);
        return "redirect:/menu/menuDetail";
    }

    /**
     * 下移
     *
     * @return
     */
    @RequestMapping("/moveDown")
    public String moveDown(@RequestParam("menuId") String menuId, @RequestParam("menuParentId") String menuParentId,
                           @RequestParam("menuSortOrder") String menuSortOrder, RedirectAttributes redirect) {
        menu.setId(menuId);
        menu.setParentId(menuParentId);
        menu.setSortOrder(Integer.parseInt(menuSortOrder));
        menuService.updateSortOrder(menu, false);

        refreshTree = true;
        /*Map map = new HashMap();
        map.put("menuId", menuParentId);
        map.put("refreshTree", refreshTree);*/
        redirect.addAttribute("menuId", menuParentId);
        redirect.addAttribute("refreshTree", refreshTree);
//        return new ModelAndView(new RedirectView("redirect:/menu/addMenu", true, false, false), map);
        return "redirect:/menu/menuDetail";
    }

}
