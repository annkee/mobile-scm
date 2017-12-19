package com.ctsig.mobilescm.domain.supplier;

import java.io.Serializable;

/**
 * 手机退货串号
 * @author bojiangzhou
 * @date 2016年5月26日
 */
public class MobileReturnNumber implements Serializable {
	
	private static final long serialVersionUID = 8841475336492333164L;

	private String id;
	
	/**
	 * 手机退货库单
	 */
	private MobileReturn mobileReturn;
	
	/**
	 * 串号一
	 */
	private String numberOne;
	
	/**
	 * 串号二
	 */
	private String numberTwo;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public MobileReturn getMobileReturn() {
		return mobileReturn;
	}

	public void setMobileReturn(MobileReturn mobileReturn) {
		this.mobileReturn = mobileReturn;
	}

	public String getNumberOne() {
		return numberOne;
	}

	public void setNumberOne(String numberOne) {
		this.numberOne = numberOne;
	}

	public String getNumberTwo() {
		return numberTwo;
	}

	public void setNumberTwo(String numberTwo) {
		this.numberTwo = numberTwo;
	}

}
