package com.ctsig.mobilescm.domain.supplier;

import java.io.Serializable;

/**
 * 手机串号
 * @author bojiangzhou
 * @date 2016年5月26日
 */
public class MobileNumber implements Serializable {
	
	private static final long serialVersionUID = 113181246070182651L;

	private String id;
	
	/**
	 * 手机入库单
	 */
	private MobileStorage mobileStorage;
	
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

	public MobileStorage getMobileStorage() {
		return mobileStorage;
	}

	public void setMobileStorage(MobileStorage mobileStorage) {
		this.mobileStorage = mobileStorage;
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
