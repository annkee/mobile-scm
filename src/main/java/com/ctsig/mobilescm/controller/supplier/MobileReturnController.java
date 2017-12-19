package com.ctsig.mobilescm.controller.supplier;

import com.alibaba.fastjson.JSONObject;
import com.ctsig.mobilescm.controller.system.BaseController;
import com.ctsig.mobilescm.domain.basic.MobileType;
import com.ctsig.mobilescm.domain.basic.Supplier;
import com.ctsig.mobilescm.domain.basic.SupplierType;
import com.ctsig.mobilescm.domain.supplier.MobileReturn;
import com.ctsig.mobilescm.domain.supplier.MobileStorage;
import com.ctsig.mobilescm.domain.supplier.StaticVariable;
import com.ctsig.mobilescm.domain.system.Page;
import com.ctsig.mobilescm.domain.system.User;
import com.ctsig.mobilescm.service.inter.basic.MobileBasicService;
import com.ctsig.mobilescm.service.inter.basic.MobileTypeService;
import com.ctsig.mobilescm.service.inter.basic.SupplierService;
import com.ctsig.mobilescm.service.inter.basic.SupplierTypeService;
import com.ctsig.mobilescm.service.inter.supplier.MobileReturnService;
import com.ctsig.mobilescm.service.inter.supplier.MobileStorageService;
import com.ctsig.mobilescm.tool.TimeTool;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.*;


/**
 * 手机退货
 */
@Controller
@RequestMapping("/mobileReturn")
public class MobileReturnController extends BaseController {

    private static final long serialVersionUID = -3737716041853936521L;
    private String serialNumber = "";
    @Resource
    private MobileReturnService service;

    @Resource
    private MobileStorageService mobileStorageService;

    @Resource
    private SupplierTypeService supplierTypeService;

    @Resource
    private SupplierService supplierService;

    @Resource
    private MobileBasicService mobileBasicService;

    @Resource
    private MobileTypeService mobileTypeService;

    @RequestMapping(value = "/list", method = {RequestMethod.POST, RequestMethod.GET})
    public String list(HttpServletRequest request, @ModelAttribute MobileReturn mobileReturn,
                       @RequestParam(value = "startDate", required = false) String startDate,
                       @RequestParam(value = "endDate", required = false) String endDate,
                       Model model, @RequestParam(value = "page.pageIndex", required = false) String pageIndex) {
        getBasicData(model);

        //处理日期
        if (endDate == null) {
            endDate = TimeTool.toDayEnd(new Date());
        }
        if (startDate == null) {
            startDate = TimeTool.toDayStart(new Date(new Date().getTime() - 7 * 24 * 60 * 60 * 1000));
        }
        //手机退货
        page = new Page();
        if (pageIndex == null) {
            page.setPageIndex(1);
        } else {
            page.setPageIndex(Integer.parseInt(pageIndex));
        }
        //获取当前用户
        User loginUser = (User) request.getSession().getAttribute("loginUser");
        page.setTotalSize(service.getTotalSize(mobileReturn, loginUser, startDate, endDate));
        page.setDataList(service.getMobileReturnList(mobileReturn, loginUser, startDate, endDate, page));
        page.setUrl(genURL(request));
        model.addAttribute("page", page);
        model.addAttribute("startDate", startDate);
        model.addAttribute("endDate", endDate);
        return "supplier/mobReturn_list";
    }

    @RequestMapping("/toAdd")
    public String toAdd(Model model) {
        getBasicData(model);

        return "supplier/mobReturn_add";
    }

    public String toEdit() {

        return "toEdit";
    }

    @RequestMapping("/add")
    public String add(@ModelAttribute MobileReturn mobileReturn, HttpServletRequest request) throws Exception {
        User loginUser = (User) request.getSession().getAttribute("loginUser");
        List<String> snList = new ArrayList<>();
        snList.add(serialNumber);
        service.addMobileReturn(mobileReturn, snList, loginUser);

        return "redirect:/mobileReturn/list";
    }

    public String edit() {

        return "toList";
    }

    public String delete() {
        //TODO 删除退机单

        return "toList";
    }

    /**
     * 审核:更新状态
     *
     * @return
     */
    @RequestMapping("/check")
    public String check(@RequestParam("mobileReturnId") String mobileReturnId, HttpServletRequest request) {
        MobileReturn mobileReturn = new MobileReturn();
        mobileReturn.setId(mobileReturnId);
        User loginUser = (User) request.getSession().getAttribute("loginUser");
        service.setCheck(mobileReturn, loginUser);
        return "redirect:/mobileReturn/list";
    }

    /**
     * 获取基础数据
     */
    private void getBasicData(Model model) {
        //供应商类别列表
        List<SupplierType> supplierTypeList = supplierTypeService.getSupplierTypeList(null);
        //供应商列表
        List<Supplier> supplierList = supplierService.getSupplierList(null);
        //品牌列表
        List<Map<String, String>> brandList = mobileBasicService.getDataList("basic_brand");
        //手机型号列表
        List<MobileType> mobileTypeList = mobileTypeService.getMobileTypeList(null, null);
        model.addAttribute("supplierTypeList", supplierTypeList);
        model.addAttribute("brandList", brandList);
        model.addAttribute("supplierList", supplierList);
        model.addAttribute("mobileTypeList", mobileTypeList);
    }

    /**
     * 验证串号
     *
     * @throws IOException
     */
    @RequestMapping("/serialNumberCheck")
    public void serialNumberCheck(@RequestBody JSONObject jsons, HttpServletRequest request, HttpServletResponse response) throws IOException {
        serialNumber = jsons.getString("serialNumber");
        Map<String, Object> params = new LinkedHashMap<>();
        User loginUser = (User) request.getSession().getAttribute("loginUser");
        params.put("numberOne", serialNumber);
        params.put("queryScopeList", loginUser.getQueryScopeList());

        MobileStorage mobileStorage = mobileStorageService.getMobileStorage(params);

        JSONObject jsonObject = new JSONObject();
        if (mobileStorage == null) { //是否存在串号
            jsonObject.put("msg", "notExist");
        } else { //存在串号
            //放入基本信息
            jsonObject.put("msg", "exist");
            jsonObject.put("numberOne", mobileStorage.getNumberOne());
            jsonObject.put("numberTwo", mobileStorage.getNumberTwo());
            jsonObject.put("supplierName", mobileStorage.getSupplier().getName());
            jsonObject.put("mobileTypeName", mobileStorage.getMobileType().getName());

            if (mobileStorage.getStatus() == StaticVariable.STATUS_NOTCHECK) {//未审核
                jsonObject.put("status", "未审核");
            } else if (mobileStorage.getStatus() == StaticVariable.STATUS_CHECKED) {//已审核
                //查询是否退货中已存在
                MobileReturn _mobileReturn = service.getMobileReturn(params);
                if (_mobileReturn == null) {
                    jsonObject.put("status", "OK");
                } else {
                    jsonObject.put("status", "已退货");
                }
            }
        }

        String json = jsonObject.toString();
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(json);
    }

}
