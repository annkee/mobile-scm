package com.ctsig.mobilescm.controller.basic;

import com.ctsig.mobilescm.domain.basic.Account;
import com.ctsig.mobilescm.domain.basic.Department;
import com.ctsig.mobilescm.service.inter.basic.AccountService;
import com.ctsig.mobilescm.service.inter.basic.BasicService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import java.util.List;


/**
 * 账户
 */
@Controller
@RequestMapping("/account")
public class AccountController {

    @Resource
    private AccountService service;

    @Resource
    private BasicService basicService;

    @RequestMapping("/list")
    public String list(@ModelAttribute Account account, Model model) {
        List<Department> departmentList = basicService.getDepartmentList(account.getDepartment());
        List<Account> accountList = service.getAccountTypeList(account);
        model.addAttribute("departmentList", departmentList);
        model.addAttribute("accountList", accountList);
        model.addAttribute("account", account);
        return "basic/account_list";
    }

    @RequestMapping("/toAdd")
    public String toAdd(Model model) {
        Account account = new Account();

        List<Department> departmentList = basicService.getDepartmentList(null);
        model.addAttribute("departmentList", departmentList);
        model.addAttribute("account", account);
        return "basic/account_add";
    }

    @RequestMapping("/toEdit")
    public String toEdit(@RequestParam("accountId") String accountId, Model model) {
        Account account = new Account();
        account.setId(accountId);
        List<Department> departmentList = basicService.getDepartmentList(null);
        account = service.getAccount(account);
        model.addAttribute("departmentList", departmentList);
        model.addAttribute("account", account);
        return "basic/account_edit";
    }

    @RequestMapping("/add")
    public String add(@ModelAttribute Account account) {
        service.addAccount(account);
        return "redirect:/account/list";
    }

    @RequestMapping("/edit")
    public String edit(@ModelAttribute Account account) {
        service.editAccount(account);
        return "redirect:/account/list";
    }

    @RequestMapping("/delete")
    public String delete(@RequestParam("accountId") String accountId) {
        Account account = new Account();
        account.setId(accountId);
        service.deleteAccount(account);
        return "redirect:/account/list";
    }
}
