package com.ctsig.mobilescm.controller.system;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.ctsig.mobilescm.domain.system.Menu;
import com.ctsig.mobilescm.domain.system.Role;
import com.ctsig.mobilescm.service.inter.system.MenuService;
import com.ctsig.mobilescm.service.inter.system.RoleService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;


/**
 *
 */
@Controller
@RequestMapping("/privilege")
public class PrivilegeController extends BaseController {

    @Resource
    private RoleService roleService;

    @Resource
    private MenuService menuService;

    /**
     * 转到权限管理页面
     *
     * @return
     */
    @RequestMapping("/toPrivilegeView")
    public String toPrivilegeView(Model model) {
        List<Role> roleList = roleService.getRoleList(null, new Integer[]{Role.ROLE_STATUS_ENABLE});
        model.addAttribute("roleList", roleList);
        return "system/privilege";
    }

    /**
     * 加载菜单树
     * json请求并返回json
     *
     * @return
     */
    @RequestMapping("/loadTree")
    public void loadTree(@RequestParam("ts") String ts, HttpServletResponse response) {
        //根菜单
        Menu menuTree1 = new Menu();
        menuTree1.setId("root");
        //查询根菜单详细
        menuTree1 = menuService.getMenu(menuTree1);
        //查询设置菜单树
        menuTree1.setSubMenuList(menuService.getMenuTree(menuTree1.getId(), null));
//        Object menuTree2 = new JSONObject().put("menuTree", menuTree1);
        String menuTree = JSON.toJSONString(menuTree1);

        try {
            response.getWriter().write(menuTree);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    /**
     * 加载角色的权限
     * json请求并返回json
     *
     * @return
     */
    @RequestMapping("/loadPrivilege")
    public void loadPrivilege(@RequestParam("roleId") String roleId, @RequestParam("ts") String ts, HttpServletResponse response) {
        Object[] privileges = new Object[2];
        privileges[0] = roleService.getRolePrivilege(roleId, true);
        privileges[1] = roleService.getRolePrivilege(roleId, false);

        String loadPrivilege = JSONArray.toJSONString(privileges);

        try {
            response.getWriter().write(loadPrivilege);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    /**
     * 保存权限配置
     *
     * @return
     * @throws IOException
     */
    @RequestMapping("/savePrivilege")
    public void savePrivilege(String roleId, String[] menuIds, String[] actionIds, HttpServletResponse response) throws IOException {
        String msg = "success";
        try {
            roleService.updateRolePrivilege(roleId, menuIds, actionIds);
        } catch (Exception e) {
            e.printStackTrace();
            msg = "exception";
        }
        response.getWriter().write(msg);
    }


}
