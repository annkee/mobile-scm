package com.ctsig.mobilescm.domain.basic;

import java.io.Serializable;

/**
 * 配件型号
 */
public class AccessoryType implements Serializable {

	private static final long serialVersionUID = 6090137424421299116L;

	private String id;
	
	/**
	 * 名称
	 */
	private String name;
	
	/**
	 * 单位：件/台/个 等
	 */
	private String unit;
	
	/**
	 * 规格
	 */
	private String specification;
	
	/**
	 * 生产工厂
	 */
	private String produceFactory;
	
	private String remark;
	
	/**
	 * 配件品牌
	 */
	private String brand;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getUnit() {
		return unit;
	}

	public void setUnit(String unit) {
		this.unit = unit;
	}

	public String getSpecification() {
		return specification;
	}

	public void setSpecification(String specification) {
		this.specification = specification;
	}

	public String getProduceFactory() {
		return produceFactory;
	}

	public void setProduceFactory(String produceFactory) {
		this.produceFactory = produceFactory;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public String getBrand() {
		return brand;
	}

	public void setBrand(String brand) {
		this.brand = brand;
	}
	
}
