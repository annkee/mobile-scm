package com.ctsig.mobilescm.domain.basic;

import java.io.Serializable;

/**
 * 客户价格：客户-手机型号-价格
 */
public class CustomerPrice implements Serializable {
	
	private static final long serialVersionUID = 5417252855276333329L;

	private String id;
	
	/**
	 * 价格
	 */
	private Double price;
	
	private Customer customer;
	
	private MobileType mobileType;
	
	/**
	 * 手机颜色
	 */
	private String color;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public Double getPrice() {
		return price;
	}

	public void setPrice(Double price) {
		this.price = price;
	}

	public Customer getCustomer() {
		return customer;
	}

	public void setCustomer(Customer customer) {
		this.customer = customer;
	}

	public MobileType getMobileType() {
		return mobileType;
	}

	public void setMobileType(MobileType mobileType) {
		this.mobileType = mobileType;
	}

	public String getColor() {
		return color;
	}

	public void setColor(String color) {
		this.color = color;
	}
	
	
}
