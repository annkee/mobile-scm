package com.ctsig.mobilescm.controller.basic;

import com.ctsig.mobilescm.domain.basic.AccessoryType;
import com.ctsig.mobilescm.service.inter.basic.AccessoryTypeService;
import com.ctsig.mobilescm.service.inter.basic.MobileBasicService;
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
 * 配件型号
 */
@Controller
@RequestMapping("/accessoryType")
public class AccessoryTypeController {

    @Resource
    private AccessoryTypeService service;

    @Resource
    private MobileBasicService mobileBasicService;

    @RequestMapping("/list")
    public String list(@ModelAttribute AccessoryType accessoryType, Model model) {
        //查询所有品牌
        List<Map<String, String>> brandList = mobileBasicService.getDataList("basic_brand");
        //获取配件型号
        List<AccessoryType> accessoryTypeList = service.getAccessoryTypeList(accessoryType);
        model.addAttribute("brandList", brandList);
        model.addAttribute("accessoryTypeList", accessoryTypeList);
        model.addAttribute("accessoryType", accessoryType);
        return "basic/accessoryType_list";
    }

    @RequestMapping("/toAdd")
    public String toAdd(Model model) {
        AccessoryType accessoryType = new AccessoryType();
        //查询所有品牌
        List<Map<String, String>> brandList = mobileBasicService.getDataList("basic_brand");
        model.addAttribute("accessoryType", accessoryType);
        model.addAttribute("brandList", brandList);
        return "basic/accessoryType_add";
    }

    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public String add(@ModelAttribute AccessoryType accessoryType) {
        service.addAccessoryType(accessoryType);
        return "redirect:/accessoryType/list";
    }

    @RequestMapping("/toEdit")
    public String toEdit(@RequestParam("accessoryTypeId") String accessoryTypeId, Model model) {
        AccessoryType accessoryType = new AccessoryType();
        accessoryType.setId(accessoryTypeId);
        //查询所有品牌
        List<Map<String, String>> brandList = mobileBasicService.getDataList("basic_brand");
        //查询当前
        accessoryType = service.getAccessoryType(accessoryType);
        model.addAttribute("accessoryType", accessoryType);
        model.addAttribute("brandList", brandList);
        return "basic/accessoryType_edit";
    }

    @RequestMapping(value = "/edit", method = RequestMethod.POST)
    public String edit(@ModelAttribute AccessoryType accessoryType) {
        service.editAccessoryType(accessoryType);
        return "redirect:/accessoryType/list";
    }

    @RequestMapping("/delete")
    public String delete(@RequestParam("accessoryTypeId") String accessoryTypeId) {
        AccessoryType accessoryType = new AccessoryType();
        accessoryType.setId(accessoryTypeId);
        service.deleteAccessoryType(accessoryType);
        return "redirect:/accessoryType/list";
    }
}
