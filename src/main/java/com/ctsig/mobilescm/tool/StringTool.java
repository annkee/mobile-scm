package com.ctsig.mobilescm.tool;

import java.io.UnsupportedEncodingException;
import java.util.UUID;

/**
 * 字符串工具类
 *
 */
public class StringTool {
	
	/**
	 * 判断字符串是否为空
	 * @param str
	 * @return true: 空 | false: 不为空
	 */
	public static boolean isEmpty(String str){
		if(str == null || "".equals(str.trim())){
			return true;
		} else{
			return false;
		}
	}
	
	public static boolean isNotEmpty(String str){
		return !isEmpty(str);
	}
	
	/**
	 * 将get方式传来的中文转为UTF-8格式
	 * @param str
	 * @return
	 */
	public static String messyCode(String str){
		String code = null;
		try {
			byte[] by = str.getBytes("ISO-8859-1");
			code = new String(by, "UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return code;
	}
	
	/**
	 * 使用UUID生成主键
	 * @return 唯一主键
	 */
	public static String uniqueKey(){
		String key = UUID.randomUUID().toString();
		//去掉'-'
		key = key.replace("-", "");
		//转换成大写
		key = key.toUpperCase();
		
		return key;
	}
	
	
	
}
