package com.ctsig.mobilescm.controller.system;

import com.ctsig.mobilescm.domain.system.Role;
import com.ctsig.mobilescm.service.inter.system.RoleService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;


/**
 * 角色管理
 */
@Controller
@RequestMapping("/role")
public class RoleController {

    @Resource
    private RoleService roleService;

    private Map<String, Integer> roleStatusMap = Role.ROLE_STATUS_MAP;
    //定义全局role并初始化
    private Role role = new Role();

    /**
     * 查询角色列表
     *
     * @return
     */
    @RequestMapping(value = "/roleList", method = {RequestMethod.POST, RequestMethod.GET})
    public String roleList(@ModelAttribute Role role, Integer[] status, Model model) {
        List<Role> roleList = roleService.getRoleList(role, status);
        model.addAttribute("roleStatusMap", roleStatusMap);
        model.addAttribute("roleList", roleList);

        return "system/role_list";
    }

    /**
     * 转到添加角色页面
     *
     * @return
     */
    @RequestMapping("/toAddRoleView")
    public String toAddRoleView(@ModelAttribute Role role) {

        return "system/role_add";
    }

    /**
     * 添加角色
     *
     * @return
     */
    @RequestMapping(value = "/addRole", method = RequestMethod.POST)
    public String addRole(@ModelAttribute Role role) {
        roleService.addRole(role);
        return "redirect:/role/roleList";
    }

    /**
     * 转到编辑角色页面
     *
     * @return
     */
    @RequestMapping("/toEditRoleView")
    public String toEditRoleView(Model model, @RequestParam("roleId") String roleId) {
//        Role role = new Role();
        role.setId(roleId);
        role = roleService.getRole(role);
        model.addAttribute("role", role);
        return "system/role_edit";
    }

    /**
     * 编辑角色
     *
     * @return
     */
    @RequestMapping(value = "/editRole", method = RequestMethod.POST)
    public String editRole(@ModelAttribute Role role) {
        roleService.editRole(role);
        return "redirect:/role/roleList";
    }

    /**
     * 删除角色:将角色状态设置为3，即删除状态
     *
     * @return
     */
    @RequestMapping("/deleteRole")
    public String deleteRole(@RequestParam("roleId") String roleId) {
//        Role role = new Role();
        role.setId(roleId);
        roleService.deleteRole(role);
        return "redirect:/role/roleList";
    }

    /**
     * 恢复‘删除’的角色
     *
     * @return
     */
    @RequestMapping("/restoreRole")
    public String restoreRole(@RequestParam("roleId") String roleId) {
//        Role role = new Role();
        role.setId(roleId);
        role.setStatus(Role.ROLE_STATUS_ENABLE);
        roleService.editRole(role);
        return "redirect:/role/roleList";
    }


}
