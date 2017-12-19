package com.ctsig.mobilescm.controller.system;

import com.ctsig.mobilescm.domain.system.Page;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.ServletResponseAware;
import org.apache.struts2.util.ServletContextAware;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.Enumeration;
import java.util.LinkedHashMap;
import java.util.Map;

/**
 * 基础Action
 */
public class BaseController extends ActionSupport implements ServletRequestAware, ServletResponseAware, ServletContextAware {

    private static final long serialVersionUID = 6282374648322582844L;

    protected HttpServletResponse response;

    protected HttpServletRequest request;

    protected ServletContext application;

    //	protected Map<String, Object> session = ActionContext.getContext().getSession();
    protected HttpSession session = null;

    /**
     * 分页
     */
    protected Page page;

    /**
     * 错误信息
     */
    protected Map<String, String> errorMap = new LinkedHashMap<>();

    @Override
    public void setServletResponse(HttpServletResponse response) {
        this.response = response;
    }

    @Override
    public void setServletRequest(HttpServletRequest request) {
        this.session = request.getSession();
        this.request = request;
    }

    @Override
    public void setServletContext(ServletContext application) {
        this.application = application;
    }

    public Page getPage() {
        return page;
    }

    public void setPage(Page page) {
        this.page = page;
    }

    /**
     * 获取访问地址
     *
     * @return
     * @throws UnsupportedEncodingException
     */
    @SuppressWarnings("unused")
    protected String genURL(HttpServletRequest request) {
        StringBuilder sb = new StringBuilder(request.getRequestURI());
        sb.append("?");
        Enumeration<String> paraNames = request.getParameterNames();
        String method = request.getMethod();
        while (paraNames.hasMoreElements()) {
            String paraName = paraNames.nextElement();
            if (!"page.pageIndex".equals(paraName)) {
                sb.append(paraName).append("=");
                try {
                    String value = request.getParameter(paraName);
                    if ("GET".equalsIgnoreCase(method)) {
                        value = new String(value.getBytes("ISO-8859-1"), "UTF-8");
                    }
                    sb.append(
                            URLEncoder.encode(value,
                                    "utf-8")).append("&");
                } catch (UnsupportedEncodingException e) {
                    e.printStackTrace();
                }
            }
        }
        return sb.toString();
    }

    public Map<String, String> getErrorMap() {
        return errorMap;
    }

}
