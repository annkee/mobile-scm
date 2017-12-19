package com.ctsig.mobilescm.controller.basic;

import com.alibaba.fastjson.JSONObject;
import com.ctsig.mobilescm.controller.system.BaseController;
import com.ctsig.mobilescm.domain.basic.BonusType;
import com.ctsig.mobilescm.domain.basic.MobileType;
import com.ctsig.mobilescm.domain.system.Page;
import com.ctsig.mobilescm.service.inter.basic.BonusTypeService;
import com.ctsig.mobilescm.service.inter.basic.MobileBasicService;
import com.ctsig.mobilescm.service.inter.basic.MobileTypeService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.List;
import java.util.Map;


/**
 * 返利类别
 */
@Controller
@RequestMapping("/mobileType")
public class MobileTypeController extends BaseController {

    @Resource
    private MobileTypeService service;

    @Resource
    private MobileBasicService mobileBasicService;

    @Resource
    private BonusTypeService bonusTypeService;

    @RequestMapping("/list")
    public String list(HttpServletRequest request, @ModelAttribute MobileType mobileType, Model model,
                       @RequestParam(value = "page.pageIndex", required = false) String pageIndex) {
        //获取所有品牌
        List<Map<String, String>> brandList = mobileBasicService.getDataList("basic_brand");
        //获取配置

        page = new Page();
        if (pageIndex == null) {
            page.setPageIndex(1);
        } else {
            page.setPageIndex(Integer.parseInt(pageIndex));
        }
        if (mobileType.getName() != null && mobileType.getBrand() != null) {
            try {
                if ("GET".equalsIgnoreCase(request.getMethod())) {
                    String name = new String(mobileType.getName().getBytes("ISO-8859-1"), "UTF-8");
                    String brand = new String(mobileType.getBrand().getBytes("ISO-8859-1"), "UTF-8");
                    mobileType.setName(name);
                    mobileType.setBrand(brand);
                }
            } catch (UnsupportedEncodingException e) {
                e.printStackTrace();
            }
        }
//		page.setPageSize(2);
        List<MobileType> mobileTypeList = service.getMobileTypeList(mobileType, page);
        page.setTotalSize(service.getTotalSize(mobileType));
        page.setDataList(mobileTypeList);
        page.setUrl(genURL(request));
        model.addAttribute("brandList", brandList);
        model.addAttribute("page", page);
        model.addAttribute("mobileType", mobileType);
        return "basic/mobtype_list";
    }

    @RequestMapping("/toAdd")
    public String toAdd(Model model) {

        //获取所有品牌
        List<Map<String, String>> brandList = mobileBasicService.getDataList("basic_brand");
        //获取返利类别
        List<BonusType> bonusTypeList = bonusTypeService.getBonusTypeList(null);
        model.addAttribute("brandList", brandList);
        model.addAttribute("bonusTypeList", bonusTypeList);
        model.addAttribute("mobileType", new MobileType());
        return "basic/mobtype_add";
    }

    @RequestMapping("/toEdit")
    public String toEdit(@RequestParam("mobileTypeId") String mobileTypeId, Model model) {

        MobileType mobileType = new MobileType();
        mobileType.setId(mobileTypeId);
        //获取所有品牌
        List<Map<String, String>> brandList = mobileBasicService.getDataList("basic_brand");
        //获取返利类别
        List<BonusType> bonusTypeList = bonusTypeService.getBonusTypeList(null);
        //获取详细
        mobileType = service.getMobile(mobileType);
        model.addAttribute("brandList", brandList);
        model.addAttribute("mobileType", mobileType);
        model.addAttribute("bonusTypeList", bonusTypeList);
        return "basic/mobtype_edit";
    }

    @ResponseBody
    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public void add(@RequestBody JSONObject json, HttpServletResponse response) {
        MobileType mobileType = new MobileType();
        mobileType.setId(json.getString("id"));
        mobileType.setName(json.getString("name"));
        mobileType.setBuyPrice(Double.parseDouble(json.getString("buyPrice")));
        mobileType.setRemark(json.getString("remark"));
        mobileType.setBrand(json.getString("brand"));
        mobileType.setMobileBonusList((List<Map<String, Object>>) json.get("bonusList"));
        boolean b = service.addMobileType(mobileType);
        String ret = "";
        if (!b) {
//            errorMap.put("mobileTypeIdRepeat", "类别编号已存在");
//            model.addAttribute("errorMap", errorMap);
//            return toAdd(model);
            ret = "repeat";
        } else {
            ret = "/mobileType/list";
        }
        try {
            response.getWriter().write(ret);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @RequestMapping("/edit")
    public void edit(@RequestBody JSONObject json, HttpServletResponse response) {
        MobileType mobileType = new MobileType();
        mobileType.setId(json.getString("id"));
        mobileType.setName(json.getString("name"));
        mobileType.setBuyPrice(Double.parseDouble(json.getString("buyPrice")));
        mobileType.setRemark(json.getString("remark"));
        mobileType.setBrand(json.getString("brand"));
        mobileType.setMobileBonusList((List<Map<String, Object>>) json.get("bonusList"));
        service.editMobileType(mobileType);
        try {
            response.getWriter().write("redirect:/mobileType/list");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @RequestMapping("/delete")
    public String delete(@RequestParam("mobileTypeId") String mobileTypeId) {
        MobileType mobileType = new MobileType();
        mobileType.setId(mobileTypeId);
        service.deleteMobileType(mobileType);
        return "redirect:/mobileType/list";
    }

    @RequestMapping("/viewBonus")
    public String viewBonus(MobileType mobileType, Model model) {
        //获取详细
        mobileType = service.getMobile(mobileType);
        model.addAttribute("mobileType", mobileType);
        return "basic/mobtype_bonus";
    }

}
