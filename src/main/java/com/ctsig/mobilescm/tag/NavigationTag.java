package com.ctsig.mobilescm.tag;

import org.springframework.stereotype.Component;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.SimpleTagSupport;
import java.io.IOException;

/**
 * 自定义标签：输出导航条
 * <my:navigation text="" />
 */
@Component
public class NavigationTag extends SimpleTagSupport {
	
	private Integer percent = 100;
	
	private String text;

	
	public void setPercent(Integer percent) {
		this.percent = percent;
	}

	public void setText(String text) {
		this.text = text;
	}
	
	public void doTag() throws JspException, IOException {
		StringBuffer sb = new StringBuffer();
		sb.append("<table border='0' cellspacing='0' cellpadding='0' align='center' width="+percent+"%>");
		sb.append("<td class='navTd1'></td>");
		sb.append("<td class='navTd2'>" + text + "</td>");
		sb.append("<td class='navTd3'></td></tr></table>");
		this.getJspContext().getOut().write(sb.toString());
	}
	
}
