package com.ctsig.mobilescm.tag;

import java.io.IOException;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.SimpleTagSupport;
import javax.servlet.jsp.tagext.TagSupport;

/**
 * 输出错误信息
 */
public class ErrorTag extends TagSupport {
	
	private static final long serialVersionUID = -9109039773492510001L;
	
	private String errorKey;
	
	public void setErrorKey(String errorKey) {
		this.errorKey = errorKey;
	}

	public int doStartTag() throws JspException {
		HttpServletRequest request = (HttpServletRequest) this.pageContext.getRequest();
		Map<String, String> errorMap = (Map<String, String>) request.getAttribute("errorMap");
		if(errorMap != null){
			String errorInfo = errorMap.get(errorKey);
			if(errorInfo != null && !"".equals(errorInfo)){
				try {
					this.pageContext.getOut().write("<font color='red'>"+errorInfo+"</font>");
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
		return SKIP_BODY;
	}
	
}
