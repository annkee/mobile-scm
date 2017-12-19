package com.ctsig.mobilescm.domain.supplier;

import java.util.LinkedHashMap;
import java.util.Map;

/**
 * 静态变量类
 */
public class StaticVariable {
	
	/**
	 * 审核状态：未审核 0
	 */
	public static final int STATUS_NOTCHECK = 0;
	/**
	 * 常量名称：未审核
	 */
	public static final String STATUS_NAME_NOTCHECK = "未审核";

	/**
	 * 审核状态：已审核 1
	 */
	public static final int STATUS_CHECKED = 1;
	/**
	 * 常量名称：已审核
	 */
	public static final String STATUS_NAME_CHECKED = "已审核";
	
	/**----------------------------------------------------------------------------------*/
	
	/**
	 * 状态：入库未审核 0
	 */
	public static final int STATUS_STOCKIN_NOTCHECKED = 0;
	/**
	 * 状态名称：入库未审核
	 */
	public static final String STATUS_NAME_STOCKIN_NOTCHECKED = "入库未审核";
	
	/**
	 * 状态：入库已审核 1
	 */
	public static final int STATUS_STOCKIN_CHECKED = 1;
	/**
	 * 状态名称：入库已审核
	 */
	public static final String STATUS_NAME_STOCKIN_CHECKED = "入库已审核";
	
	/**
	 * 状态：出库未审核 2
	 */
	public static final int STATUS_STOCKOUT_NOTCHECKED = 2;
	/**
	 * 状态名称：出库未审核
	 */
	public static final String STATUS_NAME_STOCKOUT_NOTCHECKED = "出库未审核";
	
	/**----------------------------------------------------------------------------------*/
	
	/**
	 * 交易明细：手机入库 1
	 */
	public static final int TRADE_TYPE_MOBILE_STOCKIN = 1;
	/**
	 * 交易明细：手机入库
	 */
	public static final String TRADE_TYPE_NAME_MOBILE_STOCKIN = "入库";
	
	/**
	 * 交易明细：手机退货 2
	 */
	public static final int TRADE_TYPE_MOBILE_RETURN = 2;
	/**
	 * 交易明细：手机退货
	 */
	public static final String TRADE_TYPE_NAME_MOBILE_RETURN = "退货";
	
	/**
	 * 交易明细：手机退货 3
	 */
	public static final int TRADE_TYPE_MOBILE_EXCHANGE = 3;
	/**
	 * 交易明细：手机换货
	 */
	public static final String TRADE_TYPE_NAME_MOBILE_EXCHANGE = "换货";
	
	/**
	 * 交易明细：手机退货 4
	 */
	public static final int TRADE_TYPE_MOBILE_BONUS = 4;
	/**
	 * 交易明细：手机返利
	 */
	public static final String TRADE_TYPE_NAME_MOBILE_BONUS = "返利";
	
	/**
	 * 交易明细：手机退货 5
	 */
	public static final int TRADE_TYPE_MOBILE_INSURED = 5;
	/**
	 * 交易明细：手机保价
	 */
	public static final String TRADE_TYPE_NAME_MOBILE_INSURED = "保价";
	
	/**
	 * 交易列表集合
	 */
	public static final Map<Integer, String> TRADE_TYPE_MAP = new LinkedHashMap<>();
	static {
		TRADE_TYPE_MAP.put(TRADE_TYPE_MOBILE_STOCKIN, TRADE_TYPE_NAME_MOBILE_STOCKIN);
		TRADE_TYPE_MAP.put(TRADE_TYPE_MOBILE_RETURN, TRADE_TYPE_NAME_MOBILE_RETURN);
		TRADE_TYPE_MAP.put(TRADE_TYPE_MOBILE_EXCHANGE, TRADE_TYPE_NAME_MOBILE_EXCHANGE);
		TRADE_TYPE_MAP.put(TRADE_TYPE_MOBILE_BONUS, TRADE_TYPE_NAME_MOBILE_BONUS);
		TRADE_TYPE_MAP.put(TRADE_TYPE_MOBILE_INSURED, TRADE_TYPE_NAME_MOBILE_INSURED);
	}
	
}
