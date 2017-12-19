package com.ctsig.mobilescm.tag;


import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.SimpleTagSupport;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * 日期格式化成字符串
 */
public class DateFormatTag extends SimpleTagSupport {

    private Date date;

    private String pattern;

    public void setDate(Date date) {
        this.date = date;
    }

    public void setPattern(String pattern) {
        this.pattern = pattern;
    }

    public void doTag() throws JspException, IOException {
        if (pattern == null || "".equals(pattern)) {
            pattern = "yyyy-MM-dd";
        }
        SimpleDateFormat sdf = new SimpleDateFormat(pattern);
        String ret = sdf.format(date);
    }

}
