package com.ctsig.mobilescm.controller.basic;

import com.ctsig.mobilescm.controller.system.BaseController;
import com.ctsig.mobilescm.domain.basic.SupplierType;
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
@RequestMapping("/supplierType")
public class SupplierTypeController extends BaseController {

    @Resource
    private SupplierTypeService supplierTypeService;

    @RequestMapping("/list")
    public String list(@ModelAttribute SupplierType supplierType, Model model) {

        List<SupplierType> supplierTypeList = supplierTypeService.getSupplierTypeList(null);
        model.addAttribute("supplierTypeList", supplierTypeList);
        return "basic/supplier_type_list";
    }

    @RequestMapping("/toAdd")
    public String toAdd(Model model) {
        model.addAttribute("supplierType", new SupplierType());
        return "basic/supplier_type_add";
    }

    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public String add(@ModelAttribute SupplierType supplierType, Model model) {
        boolean b = supplierTypeService.addSupplierType(supplierType);
        if (b) {
            //添加成功
            return "redirect:/supplierType/list";
        } else {
            //添加失败:账号重复
            errorMap.put("supplierTypeIdRepeat", "供应商类别编号重复");
            model.addAttribute("errorMap", errorMap);
            return toAdd(model);
        }
    }

    @RequestMapping("/toEdit")
    public String toEdit(@RequestParam("supplierTypeId") String supplierTypeId, Model model) {
        SupplierType supplierType = new SupplierType();
        supplierType.setId(supplierTypeId);
        supplierType = supplierTypeService.getSupplierType(supplierType);
        model.addAttribute("supplierType", supplierType);
        return "basic/supplier_type_edit";
    }

    @RequestMapping(value = "/edit", method = RequestMethod.POST)
    public String edit(@ModelAttribute SupplierType supplierType) {
        supplierTypeService.editSupplierType(supplierType);
        return "redirect:/supplierType/list";
    }

    @RequestMapping("/delete")
    public String delete(@RequestParam("supplierTypeId") String supplierTypeId) {
        SupplierType supplierType = new SupplierType();
        supplierType.setId(supplierTypeId);
        supplierTypeService.deleteSupplierType(supplierType);
        return "redirect:/supplierType/list";
    }

}
