package com.ctsig.mobilescm.tool;

import sun.misc.BASE64Encoder;

import java.util.List;
import java.util.Map;

/**
 * 基础工具
 */
public class BaseTool {
	
	/**
	 * 判断集合是否不为空
	 * @param collection
	 * @return
	 */
	public static boolean isCollectionNotNull(Object collection){
		if(collection instanceof Map){
			Map map = (Map) collection;
			return collection != null && map.size() > 0;
		} else if(collection instanceof List){
			List list = (List) collection;
			return collection != null && list.size() > 0;
		} else if(collection instanceof Object[]){
			Object[] array = (Object[]) collection;
			return collection != null && array.length > 0;
		}
		return false;
	}
	
	/**
	 * 使用MD5加密
	 * @param str
	 * @return
	 */
	public static String MD5Encoder(String str){
		return new BASE64Encoder().encode(str.getBytes());
	}
	
}
