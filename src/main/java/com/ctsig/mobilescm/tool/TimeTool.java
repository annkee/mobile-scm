package com.ctsig.mobilescm.tool;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * 时间工具
 */
public class TimeTool {

    /**
     * 将日期格式化成字符串
     *
     * @param date    日期
     * @param pattern 格式：如果为空则默认：yyyy-MM-dd HH:mm
     * @return
     */
    public static String formatDate(Date date, String pattern) {
        if (date != null) {
            String _pattern = "";
            if (pattern != null && !"".equals(pattern.trim())) {
                _pattern = pattern;
            } else {
                _pattern = "yyyy-MM-dd HH:mm";
            }
            SimpleDateFormat sdf = new SimpleDateFormat(_pattern);
            return sdf.format(date);
        }
        return null;
    }

    /**
     * 将日期格式化成字符串
     *
     * @param date 日期
     * @return
     */
    public static String formatDate(Date date) {
        if (date != null) {
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            return sdf.format(date);
        }
        return null;
    }

    /**
     * 转成一天的开始：去掉时分秒
     *
     * @param date
     * @return
     */
    public static String toDayStart(Date date) {
        //不要时分秒
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        String dateStr = sdf.format(date);

        return dateStr;
    }

    /**
     * 到一天的结束：到当天0点
     *
     * @param date
     * @return
     */
    public static String toDayEnd(Date date) {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        return sdf.format(new Date(date.getTime() + 24 * 60 * 60 * 1000));
    }

}
