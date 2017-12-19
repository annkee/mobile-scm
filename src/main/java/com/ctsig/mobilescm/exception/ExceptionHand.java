package com.ctsig.mobilescm.exception;

/**
 * Created by wangan.
 * 通过非法异常处理来进行拦截登录
 */

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@ControllerAdvice
public class ExceptionHand {

    private final Logger logger = LoggerFactory.getLogger(ExceptionHand.class);

    @ExceptionHandler(value = Exception.class)
    public void exception(Exception e, HttpServletResponse response) {
        logger.info("---ExceptionHand got an exception---");
        e.printStackTrace();
        try {
            //防止登录跳转到登录页面后地址栏出现jsessionid参数
            response.sendRedirect("/home/login");
        } catch (IOException e1) {
            e1.printStackTrace();
        }
//        return "redirect:/home/login";
    }
}
