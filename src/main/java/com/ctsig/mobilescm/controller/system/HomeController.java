package com.ctsig.mobilescm.controller.system;

import com.ctsig.mobilescm.domain.system.User;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 主页,当这里有 两级路径(/home/login) 时引入的css文件会后缀一个/home
 */
@Controller
@RequestMapping("/home")
public class HomeController {

    @RequestMapping(value = "/scmSystem", method = RequestMethod.GET)
    public String execute(HttpServletRequest request, HttpServletResponse response) {
        User user = (User) request.getSession().getAttribute("loginUser");
        if (user == null) {
            return "login";
        }
        return "home";
    }

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String login() {
        return "login";
    }

    @RequestMapping(value = "/welcome", method = RequestMethod.GET)
    public String welcome() {
        return "welcome";
    }

}
