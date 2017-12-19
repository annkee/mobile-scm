package com.ctsig.mobilescm.controller.basic;

import com.ctsig.mobilescm.controller.system.BaseController;
import com.ctsig.mobilescm.domain.basic.Department;
import com.ctsig.mobilescm.domain.basic.Employee;
import com.ctsig.mobilescm.domain.system.User;
import com.ctsig.mobilescm.service.inter.basic.BasicService;
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
import java.util.Map;

/**
 * 基础数据
 */
@Controller
@RequestMapping("/basic")
public class BasicController extends BaseController {

    @Resource
    private BasicService basicService;

    @Resource
    private UserService userService;

    private Map<Integer, String> employeeTypeMap = Employee.EMPLOYEE_TYPE_MAP;

    /**
     * 显示部门列表
     *
     * @return
     */
    @RequestMapping("/listDepartment")
    public String listDepartment(@ModelAttribute Department department, Model model) {
        List<Department> departmentList = basicService.getDepartmentList(department);
        model.addAttribute("departmentList", departmentList);
        model.addAttribute("department", department);
        return "basic/dept_list";
    }

    @RequestMapping("/toAddDeptView")
    public String toAddDeptView() {

        return "basic/dept_add";
    }

    @RequestMapping(value = "/addDepartment", method = RequestMethod.POST)
    public String addDepartment(@ModelAttribute Department department) {
        basicService.addDepartment(department);
        return "redirect:/basic/listDepartment";
    }

    @RequestMapping("/toEditDeptView")
    public String toEditDeptView(@ModelAttribute Department department, @RequestParam("id") String id, Model model) {
        department.setId(id);
        department = basicService.getDepartment(department);
        model.addAttribute("department", department);
        return "basic/dept_edit";
    }

    @RequestMapping(value = "/editDept", method = RequestMethod.POST)
    public String editDept(@ModelAttribute Department department) {
        basicService.editDepartment(department);
        return "redirect:/basic/listDepartment";
    }

    @RequestMapping("/deleteDept")
    public String deleteDept(@RequestParam("id") String id) {
        Department department = new Department();
        department.setId(id);
        basicService.deleteDepartmet(department);
        return "redirect:/basic/listDepartment";
    }

    //-----------Employee-------------
    @RequestMapping("/listEmployee")
    public String listEmployee(@ModelAttribute Employee employee, Model model, HttpServletRequest request) {
        //获取当前登录用户
        User loginUser = (User) request.getSession().getAttribute("loginUser");
        User p = new User();
        p.setId(loginUser.getId());
        //重新获取信息
        loginUser = userService.getUser(p);
        List<Employee> employeeList = basicService.getEmployeeList(employee, loginUser.getQueryScopeList());
        model.addAttribute("employeeList", employeeList);
        model.addAttribute("employee", employee);
        return "basic/emp_list";
    }

    @RequestMapping("/toAddEmployeeView")
    public String toAddEmployeeView(@ModelAttribute Employee employee, Model model) {
        Department department = employee.getDepartment();
        List<Department> departmentList = basicService.getDepartmentList(department);
        model.addAttribute("departmentList", departmentList);
        model.addAttribute("employeeTypeMap", employeeTypeMap);
        return "basic/emp_add";
    }

    @RequestMapping("/addEmployee")
    public String addEmployee(@ModelAttribute Employee employee) {
        basicService.addEmployee(employee);
        return "redirect:/basic/listEmployee";
    }

    @RequestMapping("/toEditEmpView")
    public String toEditEmpView(@ModelAttribute Employee employee, Model model, @RequestParam("id") String id) {
        employee.setId(id);
        Department department = employee.getDepartment();
        List<Department> departmentList = basicService.getDepartmentList(department);
        employee = basicService.getEmployee(employee);
        model.addAttribute("departmentList", departmentList);
        model.addAttribute("employee", employee);
        model.addAttribute("employeeTypeMap", employeeTypeMap);
        return "basic/emp_edit";
    }

    @RequestMapping(value = "/editEmployee", method = RequestMethod.POST)
    public String editEmployee(@ModelAttribute Employee employee) {
        basicService.editEmployee(employee);
        return "redirect:/basic/listEmployee";
    }

    @RequestMapping("/deleteEmployee")
    public String deleteEmployee(@RequestParam("id") String id) {
        Employee employee = new Employee();
        employee.setId(id);
        basicService.deleteEmployee(employee);
        return "redirect:/basic/listEmployee";
    }


}
