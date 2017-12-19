package com.ctsig.mobilescm.controller.supplier;

import com.alibaba.fastjson.JSONObject;
import com.ctsig.mobilescm.controller.system.BaseController;
import com.ctsig.mobilescm.domain.basic.MobileType;
import com.ctsig.mobilescm.domain.basic.Supplier;
import com.ctsig.mobilescm.domain.basic.SupplierType;
import com.ctsig.mobilescm.domain.supplier.MobileStorage;
import com.ctsig.mobilescm.domain.system.Page;
import com.ctsig.mobilescm.domain.system.User;
import com.ctsig.mobilescm.service.inter.basic.MobileBasicService;
import com.ctsig.mobilescm.service.inter.basic.MobileTypeService;
import com.ctsig.mobilescm.service.inter.basic.SupplierService;
import com.ctsig.mobilescm.service.inter.basic.SupplierTypeService;
import com.ctsig.mobilescm.service.inter.supplier.MobileStorageService;
import com.ctsig.mobilescm.tool.TimeTool;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * 手机入库
 */
@Controller
@RequestMapping("/mobileStorage")
public class MobileStorageController extends BaseController {

    private static final long serialVersionUID = -5031276217978106957L;
    private String serialNumber = "";
    @Resource
    private MobileStorageService service;

    @Resource
    private SupplierTypeService supplierTypeService;

    @Resource
    private SupplierService supplierService;

    @Resource
    private MobileBasicService mobileBasicService;

    @Resource
    private MobileTypeService mobileTypeService;

    @RequestMapping(value = "/list", method = {RequestMethod.POST, RequestMethod.GET})
    public String list(@ModelAttribute MobileStorage mobileStorage, @RequestParam(value = "startDate", required = false) String startDate, @RequestParam(value = "endDate", required = false) String endDate,
                       Model model, HttpServletRequest request, @RequestParam(value = "page.pageIndex", required = false) String pageIndex) {
        //获取数据
        getBasicData(model);

        //处理日期
        if (endDate == null) {

            endDate = TimeTool.toDayEnd(new Date());
        }
        if (startDate == null) {
            startDate = TimeTool.toDayStart(new Date(new Date().getTime() - 7 * 24 * 60 * 60 * 1000));
        }
        //手机库存
        page = new Page();
        if (pageIndex == null) {
            page.setPageIndex(1);
        } else {
            page.setPageIndex(Integer.parseInt(pageIndex));
        }
        //获取当前用户
        User loginUser = (User) request.getSession().getAttribute("loginUser");
        page.setTotalSize(service.getTotalSize(mobileStorage, loginUser, startDate, endDate));
        page.setDataList(service.getMobileStorageList(mobileStorage, loginUser, startDate, endDate, page));
        page.setUrl(genURL(request));
        model.addAttribute("page", page);
        model.addAttribute("startDate", startDate);
        model.addAttribute("endDate", endDate);
        return "supplier/mobStockIn_list";
    }

    @RequestMapping("/toAdd")
    public String toAdd(@ModelAttribute MobileStorage mobileStorage, Model model) {
        getBasicData(model);

        return "supplier/mobStockIn_add";
    }

    @RequestMapping("/toEdit")
    public String toEdit() {

        return "toEdit";
    }

    @RequestMapping("/add")
    public String add(@ModelAttribute MobileStorage mobileStorage, HttpServletRequest request) throws Exception {
        List<String> snList = new ArrayList<>();
        snList.add(serialNumber);
        User loginUser = (User) request.getSession().getAttribute("loginUser");
        service.addMobileStorage(mobileStorage, snList, loginUser);

        return "redirect:/mobileStorage/list";
    }

    @RequestMapping("/edit")
    public String edit() {

        return "toList";
    }

    @RequestMapping("/delete")
    public String delete(@RequestParam("mobileStorageId") String mobileStorageId) {
        // 删除入库单
        service.delete(mobileStorageId);
        return "redirect:/mobileStorage/list";
    }

    /**
     * 审核:更新状态
     *
     * @return
     */
    @RequestMapping("/check")
    public String check(@RequestParam("mobileStorageId") String mobileStorageId, HttpServletRequest request) {
        MobileStorage mobileStorage = new MobileStorage();
        mobileStorage.setId(mobileStorageId);
        User loginUser = (User) request.getSession().getAttribute("loginUser");
        service.setCheck(mobileStorage, loginUser);
        return "redirect:/mobileStorage/list";
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
        //配置列表
        List<Map<String, String>> configList = mobileBasicService.getDataList("basic_config");
        //颜色列表
        List<Map<String, String>> colorList = mobileBasicService.getDataList("basic_color");
        //手机型号列表
        List<MobileType> mobileTypeList = mobileTypeService.getMobileTypeList(null, null);
        model.addAttribute("supplierTypeList", supplierTypeList);
        model.addAttribute("brandList", brandList);
        model.addAttribute("supplierList", supplierList);
        model.addAttribute("colorList", colorList);
        model.addAttribute("configList", configList);
        model.addAttribute("mobileTypeList", mobileTypeList);
    }

    @RequestMapping("/serialNumberRepeat")
    public void serialNumberRepeat(@RequestBody JSONObject json, HttpServletResponse response) throws IOException {
        serialNumber = json.getString("serialNumber");
        boolean b = service.getSerialNumber(serialNumber);
        if (b) {
            response.getWriter().write("repeat");
        } else {
            response.getWriter().write("noRepeat");

        }
    }

}
