package com.ctsig.mobilescm.controller.system;

import com.ctsig.mobilescm.domain.basic.Department;
import com.ctsig.mobilescm.domain.basic.Employee;
import com.ctsig.mobilescm.domain.system.Role;
import com.ctsig.mobilescm.domain.system.User;
import com.ctsig.mobilescm.service.inter.basic.BasicService;
import com.ctsig.mobilescm.service.inter.system.RoleService;
import com.ctsig.mobilescm.service.inter.system.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 *
 */
@Controller
@RequestMapping(value = "/user")
public class UserController extends BaseController {

    @Resource
    private UserService userService;

    @Resource
    private BasicService basicService;

    @Resource
    private RoleService roleService;

    private User user;

    /**
     * 显示用户列表
     *
     * @return
     */
    @RequestMapping(value = "/listUser", method = {RequestMethod.POST, RequestMethod.GET})
    public String listUser(@ModelAttribute User user, Model model) {

        //查询
        List<User> userList = userService.getUserList(user);
        model.addAttribute("userList", userList);
        return "user/user_list";
    }

    @RequestMapping("/toAddUserView")
    public String toAddUserView(@RequestParam("userEmployeeId") String userEmployeeId, Model model) {
        Employee employee=new Employee();
        employee.setId(userEmployeeId);
        user=new User();
        user.setEmployee(employee);
        //设置用户的所属员工
        user.setEmployee(basicService.getEmployee(user.getEmployee()));

        //获取所有角色
        List<Role> roleList = roleService.getRoleList(null, null);

        //获取所有部门
        List<Department> departmentList = basicService.getDepartmentList(null);
        model.addAttribute("user", user);
        model.addAttribute("roleList", roleList);
        model.addAttribute("departmentList", departmentList);
        return "user/user_add";
    }

    @RequestMapping(value = "/addUser", method = RequestMethod.POST)
    public String addUser(@ModelAttribute User user) {
        userService.addUser(user);

        return "redirect:/user/listUser";
    }

    @RequestMapping("/toEditUserView")
    public String toEditUserView(@RequestParam("id") String id, Model model) {
        user = new User();
        user.setId(id);
        //获取用户详细信息
        user = userService.getUser(user);
        //获取所有角色
        List<Role> roleList = roleService.getRoleList(null, null);

        //获取所有部门
        List<Department> departmentList = basicService.getDepartmentList(null);
        model.addAttribute("user", user);
        model.addAttribute("roleList", roleList);
        model.addAttribute("departmentList", departmentList);

        return "user/user_edit";
    }

    @RequestMapping(value = "/editUser", method = RequestMethod.POST)
    public String editUser(@ModelAttribute User user) {
        userService.editUser(user, false);
        return "redirect:/user/listUser";
    }

    @RequestMapping("/deleteUser")
    public String deleteUser(@RequestParam("id") String id, @RequestParam("employeeId") String employeeId) {
        user.setId(id);
        Employee employee = user.getEmployee();
        employee.setId(employeeId);
        user.setEmployee(employee);
        userService.deleteUser(user);
        return "redirect:/user/listUser";
    }

    @RequestMapping("/toModifyPasswdView")
    public String toModifyPasswdView() {

        return "user/user_repass";
    }

    /**
     * 修改密码
     */
    @RequestMapping(value = "/modifyPasswd", method = RequestMethod.POST)
    public String modifyPasswd(@ModelAttribute User user, HttpServletRequest request) {
        //修改密码
        userService.editUser(user, true);
        //移除登录用户
        request.getSession().removeAttribute("loginUser");
        //重新登录
        return "redirect:/home/login";
    }

    @RequestMapping(value = "/logout")
    public String logout(HttpServletRequest request) {

        //清除所有信息
        request.getSession().invalidate();
        return "redirect:/home/login";
    }


}
