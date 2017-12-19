package com.ctsig.mobilescm.controller.system;

import com.ctsig.mobilescm.domain.system.Log;
import com.ctsig.mobilescm.domain.system.Page;
import com.ctsig.mobilescm.domain.system.User;
import com.ctsig.mobilescm.service.inter.system.LogService;
import com.ctsig.mobilescm.service.inter.system.UserService;
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
import java.util.Date;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

/**
 * 日志
 */
@Controller
@RequestMapping("/log")
public class LogController extends BaseController {

    private static final long serialVersionUID = 5970468477797823327L;

    @Resource
    private LogService logService;


    @Resource
    private UserService userService;

    @RequestMapping(value = "/listLog", method = {RequestMethod.POST, RequestMethod.GET})
    public String listLog(@ModelAttribute Log log, @RequestParam(value = "beginDate", required = false) String beginDate, @RequestParam(value = "endDate", required = false) String endDate,
                          @RequestParam(value = "userAccount", required = false) String userAccount, Model model, HttpServletRequest request,
                          @RequestParam(value = "page.pageIndex", required = false) String pageIndex) {
        if (endDate == null) {
            //默认设置为当前时间
            endDate = TimeTool.toDayEnd(new Date());
        }
        if (beginDate == null) {
            //默认为一周前

            beginDate = TimeTool.toDayStart(new Date(new Date().getTime() - 7 * 24 * 60 * 60 * 1000));
        }
        //查询用户集合

        List<User> userList = userService.getUserList(null);
        model.addAttribute("userList", userList);
        page = new Page();
        if (pageIndex == null) {
            page.setPageIndex(1);
        } else {
            page.setPageIndex(Integer.parseInt(pageIndex));
        }

        Map<String, Object> param = new LinkedHashMap<>();
        param.put("beginDate", beginDate);
        param.put("endDate", endDate);

        if (StringTool.isNotEmpty(userAccount)) {
            param.put("userAccount", userAccount);
        }
        param.put("start", page.getStart());
        param.put("size", page.getPageSize());
        //查询日志
        List<Log> logList = logService.getLogList(param);

        page.setDataList(logList);

        page.setUrl(genURL(request));

        page.setTotalSize(logService.getTotal(param));
        model.addAttribute("page", page);
        model.addAttribute("beginDate", beginDate);
        model.addAttribute("endDate", endDate);
        return "system/log_list";
    }

    public String deleteLog() {
        return null;
    }


}
