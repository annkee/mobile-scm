package com.ctsig.mobilescm.controller.basic;

import com.ctsig.mobilescm.controller.system.BaseController;
import com.ctsig.mobilescm.domain.basic.Customer;
import com.ctsig.mobilescm.domain.basic.CustomerType;
import com.ctsig.mobilescm.domain.system.Page;
import com.ctsig.mobilescm.service.inter.basic.CustomerService;
import com.ctsig.mobilescm.service.inter.basic.CustomerTypeService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.io.UnsupportedEncodingException;
import java.util.List;


/**
 *
 */
@Controller
@RequestMapping("/customer")
public class CustomerController extends BaseController {

    @Resource
    private CustomerService service;

    @Resource
    private CustomerTypeService customerTypeService;

    @RequestMapping("/list")
    public String list(@ModelAttribute Customer customer, HttpServletRequest request, Model model,
                       @RequestParam(value = "page.pageIndex", required = false) String pageIndex) {
        List<CustomerType> customerTypeList = customerTypeService.getCustomerTypeList(null);
        //分页
        page = new Page();
        if (pageIndex == null) {
            page.setPageIndex(1);
        } else {
            page.setPageIndex(Integer.parseInt(pageIndex));
        }
        if (customer.getName() != null) {
            try {
                if ("GET".equalsIgnoreCase(request.getMethod())) {
                    String name = new String(customer.getName().getBytes("ISO-8859-1"), "UTF-8");
                    customer.setName(name);
                }
            } catch (UnsupportedEncodingException e) {
                e.printStackTrace();
            }
        }

        List<Customer> customerList = service.getCustomerList(customer, page);
        page.setTotalSize(service.getTotalSize(customer));
        page.setDataList(customerList);
        page.setUrl(genURL(request));
        model.addAttribute("customerTypeList", customerTypeList);
        model.addAttribute("page", page);
        model.addAttribute("customer", customer);
        return "basic/cust_list";
    }

    @RequestMapping("/toAdd")
    public String toAdd(Model model) {
        List<CustomerType> customerTypeList = customerTypeService.getCustomerTypeList(null);
        errorMap.put("customerIdRepeat", null);
        model.addAttribute("customerTypeList", customerTypeList);
        model.addAttribute("customer", new Customer());
        model.addAttribute("errorMap",errorMap);
        return "basic/cust_add";
    }

    @RequestMapping("/toEdit")
    public String toEdit(@RequestParam("customerId") String customerId, Model model) {
        List<CustomerType> customerTypeList = customerTypeService.getCustomerTypeList(null);
        Customer customer = new Customer();
        customer.setId(customerId);
        customer = service.getCustomer(customer);
        model.addAttribute("customerTypeList", customerTypeList);
        model.addAttribute("customer", customer);
        return "basic/cust_edit";
    }

    @RequestMapping("/add")
    public String add(@ModelAttribute Customer customer, Model model) {
        boolean b = service.addCustomer(customer);
        if (!b) {
            errorMap.put("customerIdRepeat", "客户编号已存在");
            model.addAttribute("errorMap", errorMap);
            return toAdd(model);
        }
        return "redirect:/customer/list";
    }

    @RequestMapping("/edit")
    public String edit(@ModelAttribute Customer customer) {
        service.editCustomer(customer);
        return "redirect:/customer/list";
    }

    @RequestMapping("/delete")
    public String delete(@RequestParam("customerId") String customerId) {
        Customer customer = new Customer();
        customer.setId(customerId);
        service.deleteCustomer(customer);
        return "redirect:/customer/list";
    }


}
