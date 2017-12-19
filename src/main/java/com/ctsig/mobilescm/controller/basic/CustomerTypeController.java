package com.ctsig.mobilescm.controller.basic;

import com.ctsig.mobilescm.domain.basic.CustomerType;
import com.ctsig.mobilescm.service.inter.basic.CustomerTypeService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import java.util.List;


/**
 * 客户类别
 */
@Controller
@RequestMapping("/customerType")
public class CustomerTypeController {

    @Resource
    private CustomerTypeService service;

    @RequestMapping("/list")
    public String list(Model model) {
        CustomerType customerType = new CustomerType();
        List<CustomerType> customerTypeList = service.getCustomerTypeList(customerType);
        model.addAttribute("customerTypeList", customerTypeList);
        return "basic/cust_type_list";
    }

    @RequestMapping("/toAdd")
    public String toAdd() {
        return "basic/cust_type_add";
    }

    @RequestMapping("/toEdit")
    public String toEdit(@RequestParam("customerTypeId") String customerTypeId, Model model) {
        CustomerType customerType = new CustomerType();
        customerType.setId(customerTypeId);
        customerType = service.getCustomerType(customerType);
        model.addAttribute("customerType", customerType);
        return "basic/cust_type_edit";
    }

    @RequestMapping("/add")
    public String add(@ModelAttribute CustomerType customerType) {
        service.addCustomerType(customerType);
        return "redirect:/customerType/list";
    }

    @RequestMapping("/edit")
    public String edit(@ModelAttribute CustomerType customerType) {
        service.editCustomerType(customerType);
        return "redirect:/customerType/list";
    }

    @RequestMapping("/delete")
    public String delete(@RequestParam("customerTypeId") String customerTypeId) {
        CustomerType customerType = new CustomerType();
        customerType.setId(customerTypeId);
        service.deleteCustomerType(customerType);
        return "redirect:/customerType/list";
    }

}
