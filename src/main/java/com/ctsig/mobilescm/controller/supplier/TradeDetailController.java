package com.ctsig.mobilescm.controller.supplier;

import com.ctsig.mobilescm.controller.system.BaseController;
import com.ctsig.mobilescm.domain.basic.Supplier;
import com.ctsig.mobilescm.domain.basic.SupplierType;
import com.ctsig.mobilescm.domain.supplier.StaticVariable;
import com.ctsig.mobilescm.domain.supplier.TradeDetail;
import com.ctsig.mobilescm.domain.system.User;
import com.ctsig.mobilescm.service.inter.basic.SupplierService;
import com.ctsig.mobilescm.service.inter.basic.SupplierTypeService;
import com.ctsig.mobilescm.service.inter.supplier.TradeDetailService;
import com.ctsig.mobilescm.tool.ExcelTool;
import com.ctsig.mobilescm.tool.StringTool;
import com.ctsig.mobilescm.tool.TimeTool;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.net.URLEncoder;
import java.util.Date;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;


/**
 * 交易详细
 */
@Controller
@RequestMapping("/tradeDetail")
public class TradeDetailController extends BaseController {

    private static final long serialVersionUID = -4880857218825082458L;
    /**
     * 交易类别列表
     */
    private Map<Integer, String> tradeTypeMap = StaticVariable.TRADE_TYPE_MAP;

    @Resource
    private TradeDetailService service;

    @Resource
    private SupplierTypeService supplierTypeService;

    @Resource
    private SupplierService supplierService;

    @RequestMapping(value = "/list", method = {RequestMethod.POST, RequestMethod.GET})
    public String list(@ModelAttribute TradeDetail tradeDetail, @RequestParam(value = "startDate", required = false) String startDate, @RequestParam(value = "endDate", required = false) String endDate,
                       Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {
        List<SupplierType> supplierTypeList = null;
        if (tradeDetail.getSupplier() == null) {
            //供应商类别列表
            supplierTypeList = supplierTypeService.getSupplierTypeList(null);
        } else {

            supplierTypeList = supplierTypeService.getSupplierTypeList(tradeDetail.getSupplier().getSupplierType());
        }

        //供应商列表
        List<Supplier> supplierList = supplierService.getSupplierList(tradeDetail.getSupplier());

        //处理日期
        if (endDate == null) {
            endDate = TimeTool.toDayEnd(new Date());
        }
        if (startDate == null) {
            startDate = TimeTool.toDayStart(new Date(new Date().getTime() - 7 * 24 * 60 * 60 * 1000));
        }
        User loginUser = (User) request.getSession().getAttribute("loginUser");
        Map<String, Object> params = new LinkedHashMap<>();
        params.put("startDate", startDate);
        params.put("endDate", endDate);
        if (loginUser != null) {
            params.put("queryScopeList", loginUser.getQueryScopeList());
        }
        if (tradeDetail != null) {
            if (tradeDetail.getSupplier() != null) {
                if (StringTool.isNotEmpty(tradeDetail.getSupplier().getId())) {
                    params.put("supplierId", tradeDetail.getSupplier().getId());
                } else if (tradeDetail.getSupplier().getSupplierType() != null && StringTool.isNotEmpty(tradeDetail.getSupplier().getSupplierType().getId())) {
                    params.put("supplierTypeId", tradeDetail.getSupplier().getSupplierType().getId());
                }
                if (tradeDetail.getTradeType() != null && tradeDetail.getTradeType() != 0) {
                    params.put("tradeType", tradeDetail.getTradeType());
                }
            }
        }
        List<TradeDetail> tradeDetailList = service.getTradeDetailList(params);
        model.addAttribute("startDate", startDate);
        model.addAttribute("endDate", endDate);
        model.addAttribute("supplierTypeList", supplierTypeList);
        model.addAttribute("supplierList", supplierList);
        model.addAttribute("tradeTypeMap", tradeTypeMap);
        model.addAttribute("tradeDetailList", tradeDetailList);
        if ("导出Excel".equalsIgnoreCase(tradeDetail.getShow())) {

            //设置文件名
            String fileName = "交易明细.xls";
            //定义输出类型
            response.setContentType("application/msexcel;charset=utf-8");
            //设定输出文件头
            response.setHeader("Content-Disposition", "attachment; filename=" + URLEncoder.encode(fileName, "UTF-8"));

            String[] headers = new String[]{"交易单号", "供应商", "型号编号", "交易类型", "单价", "数量", "总金额", "录入人", "审核人", "状态", "备注", "机构"};
            String[] properties = new String[]{"id", "supplier.name", "typeId", "tradeTypeName", "unitPrice", "amount", "totalMoney", "inputUserName", "checkUserName", "statusName", "remark", "department.name"};
            ExcelTool<TradeDetail> excelTool = new ExcelTool<>();

            excelTool.exportExcel(headers, properties, tradeDetailList, response.getOutputStream());

            return null;
        } else {
            return "supplier/tradeDetail_list";
        }

    }


}
