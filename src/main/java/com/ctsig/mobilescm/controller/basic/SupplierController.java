package com.ctsig.mobilescm.controller.basic;

import com.ctsig.mobilescm.controller.system.BaseController;
import com.ctsig.mobilescm.domain.basic.Supplier;
import com.ctsig.mobilescm.domain.basic.SupplierType;
import com.ctsig.mobilescm.service.inter.basic.SupplierService;
import com.ctsig.mobilescm.service.inter.basic.SupplierTypeService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import java.util.List;


/**
 * 供应商类别
 */
@Controller
@RequestMapping("/supplier")
public class SupplierController extends BaseController {

    @Resource
    private SupplierService service;

    @Resource
    private SupplierTypeService supplierTypeService;

    @RequestMapping("/list")
    public String list(@ModelAttribute Supplier supplier, Model model) {
        //查询所有供应商类别
        List<SupplierType> supplierTypeList = supplierTypeService.getSupplierTypeList(null);
        //查询供应商
        List<Supplier> supplierList = service.getSupplierList(supplier);
        model.addAttribute("supplierTypeList", supplierTypeList);
        model.addAttribute("supplierList", supplierList);
        model.addAttribute("supplier", supplier);
        return "basic/supplier_list";
    }

    @RequestMapping("/toAdd")
    public String toAdd(Model model) {
        //查询所有供应商类别
        List<SupplierType> supplierTypeList = supplierTypeService.getSupplierTypeList(null);
        model.addAttribute("supplierTypeList", supplierTypeList);
        model.addAttribute("supplier", new Supplier());
        return "basic/supplier_add";
    }

    @RequestMapping("/toEdit")
    public String toEdit(@RequestParam("supplierId") String supplierId, Model model) {
        Supplier supplier = new Supplier();
        supplier.setId(supplierId);
        //查询所有供应商类别
        List<SupplierType> supplierTypeList = supplierTypeService.getSupplierTypeList(null);
        //查询供应商
        supplier = service.getSupplier(supplier);
        model.addAttribute("supplier", supplier);
        model.addAttribute("supplierTypeList", supplierTypeList);
        return "basic/supplier_edit";
    }

    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public String add(@ModelAttribute Supplier supplier, Model model) {
        boolean b = service.addSupplier(supplier);
        if (b) {
            //添加成功
            return "redirect:/supplier/list";
        } else {
            //添加失败:账号重复
            errorMap.put("supplierIdRepeat", "供应商编号重复");
            model.addAttribute("errorMap", errorMap);
            return toAdd(model);
        }
    }

    @RequestMapping("/edit")
    public String edit(@ModelAttribute Supplier supplier, Model model) {
        service.editSupplier(supplier);
        return "redirect:/supplier/list";
    }

    @RequestMapping("/delete")
    public String delete(@RequestParam("supplierId") String supplierId) {
        Supplier supplier = new Supplier();
        supplier.setId(supplierId);
        service.deleteSupplier(supplier);
        return "redirect:/supplier/list";
    }

}
