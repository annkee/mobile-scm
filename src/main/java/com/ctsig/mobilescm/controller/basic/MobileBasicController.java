package com.ctsig.mobilescm.controller.basic;

import com.ctsig.mobilescm.service.inter.basic.MobileBasicService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;


/**
 * 手机基础设置：品牌、颜色、配置
 */
@Controller
@RequestMapping("/mobileBasic")
public class MobileBasicController {

    @Resource(name = "mobileBasicService")
    private MobileBasicService service;

    /**
     * 数据集合
     */
    private List<Map<String, String>> dataList;

    /**
     * 要操作的表
     */
    private String table;

    /**
     * 当前ID
     */
    private String id;

    /**
     * 数据
     */
    private String data;

    public String getTable() {
        return table;
    }

    public void setTable(String table) {
        this.table = table;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public List<Map<String, String>> getDataList() {
        return dataList;
    }

    public String getData() {
        return data;
    }

    public void setData(String data) {
        this.data = data;
    }

    @RequestMapping("/list")
    public String list(@RequestParam(value = "table", required = false) String table, Model model) {
        dataList = service.getDataList(table);
        model.addAttribute("dataList", dataList);
        if ("basic_brand".equals(table)) {
            return "basic/brand";
        } else if ("basic_color".equals(table)) {
            return "basic/color";
        } else if ("basic_config".equals(table)) {
            return "basic/config";
        }
        return null;
    }

    @RequestMapping("/delete")
    public String delete(@RequestParam("table") String table, @RequestParam("id") String id) {
        service.deleteData(table, id);

//        return list();
        //重定向带参
        return "redirect:/mobileBasic/list?table=" + table;
    }

    @RequestMapping("/add")
    public String add(@ModelAttribute MobileBasicController mobileBasicController) {

//        service.addData(table, data);
        service.addData(mobileBasicController.getTable(), mobileBasicController.getData());
        return "redirect:/mobileBasic/list?table=" + mobileBasicController.getTable();
    }

}
