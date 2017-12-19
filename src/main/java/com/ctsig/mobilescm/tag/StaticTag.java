package com.ctsig.mobilescm.tag;

import java.io.IOException;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.SimpleTagSupport;

/**
 * 自定义标签：读取静态变量
 * <my:static className="" fieldName="" />
 */
public class StaticTag extends SimpleTagSupport {
	
	/**
	 * 类名
	 */
	private String className;
	/**
	 * 要读取的字段名
	 */
	private String fieldName;
	
	public void setClassName(String className) {
		this.className = className;
	}

	public void setFieldName(String fieldName) {
		this.fieldName = fieldName;
	}
	
	public void doTag() throws JspException, IOException {
		try {
			//通过反射获取字段值
			String value = Class.forName(className).getField(fieldName).get(null).toString();
			//输出到浏览器
			this.getJspContext().getOut().write(value);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
}
