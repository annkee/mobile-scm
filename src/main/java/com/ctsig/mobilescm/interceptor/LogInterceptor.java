package com.ctsig.mobilescm.interceptor;

import com.ctsig.mobilescm.domain.system.Log;
import com.ctsig.mobilescm.domain.system.User;
import com.ctsig.mobilescm.service.inter.system.LogService;
import com.ctsig.mobilescm.tool.StringTool;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.Enumeration;

/**
 * 日志拦截器
 */
@Component
public class LogInterceptor implements HandlerInterceptor {

    private Logger logger = LoggerFactory.getLogger(LogInterceptor.class);

    @Autowired
    private LogService logService;

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse httpServletResponse, Object handler) throws Exception {

        /**
         * 对来自后台的请求统一进行日志处理
         */
        String url = request.getRequestURL().toString();
        String method = request.getMethod();
        String uri = request.getRequestURI();
        String queryString = request.getQueryString();

        HttpSession session = request.getSession();

        //获取actionName
        String actionName = uri.substring(uri.lastIndexOf("/") + 1);
        /**
         * 通过注解判断方法是否需要记录日志：方式三
         */

        //获取当前用户
        User loginUser = (User) session.getAttribute("loginUser");
        //获取所有参数名
        StringBuilder sb = new StringBuilder();
        Enumeration<String> pNames = request.getParameterNames();
        while (pNames.hasMoreElements()) {
            String pName = pNames.nextElement();
            String[] values = request.getParameterValues(pName);
            sb.append("[" + pName + ":");
            for (String value : values) {
                sb.append(value + "、");
            }
            sb.deleteCharAt(sb.length() - 1);
            sb.append("],");
        }
        if (sb.length() != 0) {
            sb.deleteCharAt(sb.length() - 1);
        }
        Log log = new Log();
        log.setId(StringTool.uniqueKey());
        log.setActionName(actionName);
        if (loginUser != null) {
            log.setAccount(loginUser.getAccount());
            log.setParameter(sb.toString());
            log.setOperTime(new Date());
            //添加日志
            logService.addLog(log);
        }

        if (loginUser == null && !url.contains("home") && !url.contains("system/login")) {
            throw new RuntimeException("--LogInterceptor--invalidate login");
        }

        return true;
    }

    @Override
    public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, ModelAndView modelAndView) throws Exception {

    }

    @Override
    public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) throws Exception {

    }
}
