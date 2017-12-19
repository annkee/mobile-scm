package com.ctsig.mobilescm.controller.basic;

import com.ctsig.mobilescm.domain.basic.BonusType;
import com.ctsig.mobilescm.service.inter.basic.BonusTypeService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import java.util.List;

/**
 * 返利类别
 */
@Controller
@RequestMapping("/bonusType")
public class BonusTypeController {

    @Resource
    private BonusTypeService service;

    @RequestMapping("/list")
    public String list(Model model) {
        BonusType bonusType = new BonusType();
        List<BonusType> bonusTypeList = service.getBonusTypeList(bonusType);
        model.addAttribute("bonusTypeList", bonusTypeList);
        return "basic/bonus_list";
    }

    @RequestMapping("/toAdd")
    public String toAdd(Model model) {
        BonusType bonusType = new BonusType();
        model.addAttribute("bonusType", bonusType);
        return "basic/bonus_add";
    }

    @RequestMapping("/toEdit")
    public String toEdit(@RequestParam("bonusTypeId") String bonusTypeId, Model model) {
        BonusType bonusType = new BonusType();
        bonusType.setId(bonusTypeId);
        bonusType = service.getBonusType(bonusType);
        model.addAttribute("bonusType", bonusType);
        return "basic/bonus_edit";
    }

    @RequestMapping("/add")
    public String add(@ModelAttribute BonusType bonusType) {
        service.addBonusType(bonusType);
        return "redirect:/bonusType/list";
    }

    @RequestMapping("/edit")
    public String edit(@ModelAttribute BonusType bonusType) {

        service.editBonusType(bonusType);
        return "redirect:/bonusType/list";
    }

    @RequestMapping("/delete")
    public String delete(@RequestParam("bonusTypeId") String bonusTypeId) {
        BonusType bonusType = new BonusType();
        bonusType.setId(bonusTypeId);
        service.deleteBonusType(bonusType);
        return "redirect:/bonusType/list";
    }

}
