//package com.ctsig.mobilescm.annotation;
//
//import com.ctsig.mobilescm.domain.system.Log;
//import com.ctsig.mobilescm.domain.system.User;
//import com.ctsig.mobilescm.service.inter.system.LogService;
//import com.ctsig.mobilescm.tool.StringTool;
//import org.aspectj.lang.JoinPoint;
//import org.aspectj.lang.annotation.AfterReturning;
//import org.aspectj.lang.annotation.Aspect;
//import org.aspectj.lang.annotation.Before;
//import org.aspectj.lang.annotation.Pointcut;
//import org.slf4j.Logger;
//import org.slf4j.LoggerFactory;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Component;
//import org.springframework.web.context.request.RequestContextHolder;
//import org.springframework.web.context.request.ServletRequestAttributes;
//
//import javax.servlet.http.HttpServletRequest;
//import java.util.Arrays;
//import java.util.Date;
//import java.util.Enumeration;
//
///**
// * Web层日志切面
// */
//@Aspect
//@Component
//public class WebLogAspect {
//
//    private static final Logger logger = LoggerFactory.getLogger(WebLogAspect.class);
//
//    @Autowired
//    private LogService logService;
//
//    ThreadLocal<Long> startTime = new ThreadLocal<>();
//
//    @Pointcut("execution(public * com.ctsig.mobilescm.controller..*.*(..))")
//    public void log() {
//    }
//
//    @Before("log()")
//    public void doBefore(JoinPoint joinPoint) throws Throwable {
//        startTime.set(System.currentTimeMillis());
//
//        // 接收到请求，记录请求内容
//        ServletRequestAttributes attributes = (ServletRequestAttributes) RequestContextHolder.getRequestAttributes();
//        HttpServletRequest request = attributes.getRequest();
//
//        // 记录下请求内容
//        logger.info("URL : " + request.getRequestURL().toString());
//        logger.info("HTTP_METHOD : " + request.getMethod());
//        logger.info("IP : " + request.getRemoteAddr());
//        logger.info("CLASS_METHOD : " + joinPoint.getSignature().getDeclaringTypeName() + "." + joinPoint.getSignature().getName());
//        logger.info("ARGS : " + Arrays.toString(joinPoint.getArgs()));
//
//        String url = request.getRequestURL().toString();
//        String method = request.getMethod();
//        String uri = request.getRequestURI();
//        String queryString = request.getQueryString();
//
//        //获取actionName
//        String actionName = uri.substring(uri.lastIndexOf("/") + 1);
//
//        //获取当前用户
//        User loginUser = (User) request.getSession().getAttribute("loginUser");
//        //获取所有参数名
//        StringBuilder sb = new StringBuilder();
//        Enumeration<String> pNames = request.getParameterNames();
//        while (pNames.hasMoreElements()) {
//            String pName = pNames.nextElement();
//            String[] values = request.getParameterValues(pName);
//            sb.append("[" + pName + ":");
//            for (String value : values) {
//                sb.append(value + "、");
//            }
//            sb.deleteCharAt(sb.length() - 1);
//            sb.append("],");
//        }
//        if (sb.length() != 0) {
//            sb.deleteCharAt(sb.length() - 1);
//        }
//        Log log = new Log();
//        log.setId(StringTool.uniqueKey());
//        log.setActionName(actionName);
//        if (loginUser != null) {
//            log.setAccount(loginUser.getAccount());
//            log.setParameter(sb.toString());
//            log.setOperTime(new Date());
//            //添加日志
//            logService.addLog(log);
//        }
//
//    }
//
//    @AfterReturning(returning = "ret", pointcut = "log()")
//    public void doAfterReturning(Object ret) throws Throwable {
//        // 处理完请求，返回内容
//        logger.info("RESPONSE : " + ret);
//        logger.info("SPEND TIME : " + (System.currentTimeMillis() - startTime.get()));
//    }
//
//
//}
//
