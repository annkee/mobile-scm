package com.ctsig.mobilescm.controller.system;

import com.alibaba.fastjson.JSONObject;
import com.ctsig.mobilescm.domain.system.User;
import com.ctsig.mobilescm.service.inter.system.SystemService;
import com.ctsig.mobilescm.tool.BaseTool;
import com.ctsig.mobilescm.tool.VCodeGenerator;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Set;

//import net.sf.json.JSONObject;

/**
 * 系统Action
 */
@Controller
@RequestMapping("/system")
public class SystemController extends BaseController {

    private static final long serialVersionUID = -8568073822117494782L;
    private final Logger logger = LoggerFactory.getLogger(SystemController.class);
    @Resource
    private SystemService systemService;


    /**
     * 获取验证码
     *
     * @return
     * @throws IOException
     */
    @RequestMapping(value = "/getVCode", method = RequestMethod.GET)
    public void getVCode(HttpServletRequest request, HttpServletResponse response, @RequestParam(value = "time", required = false) Long time) throws IOException {
        VCodeGenerator vcg = new VCodeGenerator();
        String vcode = vcg.generatorVCode();
        request.getSession().setAttribute("vcode", vcode);
        BufferedImage vcodeImg = vcg.generatorVCodeImage(vcode, true);
        ImageIO.write(vcodeImg, "gif", response.getOutputStream());
    }

    /**
     * 用户登录
     *
     * @return
     * @throws IOException
     */
    @ResponseBody
    @RequestMapping(value = "/login")
    public void login(@RequestBody JSONObject json, HttpServletRequest request, HttpServletResponse response) {
        response.setCharacterEncoding("utf-8");
        String session_vcode = (String) request.getSession().getAttribute("vcode");
        String vcode = json.getString("vcode");
        String account = json.getString("account");
        String password = json.getString("password");
        JSONObject result = new JSONObject();
        if (!session_vcode.equalsIgnoreCase(vcode)) {
            result.put("msg", "验证码错误");
        } else {
            Map<String, Object> param = new LinkedHashMap<>();
            param.put("loginAccount", account);
//            这个是将加密的密码传到了mapper
            param.put("password", BaseTool.MD5Encoder(password));
//            param.put("password", password);
            param.put("status", User.USER_STATUS_ENABLE);
            User ret_user = systemService.login(param);
            if (ret_user != null) {
                result.put("msg", "success");
                //移除验证码
                request.getSession().removeAttribute("vcode");
                ret_user.setPassword("");
                //将用户信息放入SESSION
                request.getSession().setAttribute("loginUser", ret_user);
                //设置用户皮肤
                request.getSession().setAttribute("skin", ret_user.getSkin());

                //加载当前用户的权限
                Set<String> actionSet = systemService.getUserActionSet(ret_user.getRoleIdList());
                //保存到session
                request.getSession().setAttribute("actionSet", actionSet);

            } else {
                result.put("msg", "用户名或密码错误");
            }
        }
        try {
            response.getWriter().write(result.toString());
        } catch (IOException e) {
            e.printStackTrace();
        }

    }

    public String toWelcomeView() {
        return "welcome";
    }


}
