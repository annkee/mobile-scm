package com.ctsig.mobilescm.domain.basic;

import net.sf.json.JSONObject;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 手机型号
 */
public class MobileType implements Serializable {
	
	private static final long serialVersionUID = -9066059241252234027L;

	private String id;
	
	/**
	 * 手机型号名称
	 */
	private String name;
	
	/**
	 * 进货价
	 */
	private Double buyPrice;
	
	private String remark;
	
	/**
	 * 手机品牌
	 */
	private String brand;
	
	/**
	 * 手机配置
	 */
	private String config;
	
	private List<Map<String, Object>> mobileBonusList = new ArrayList<>();

	private String[] bonusList;

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

	public Double getBuyPrice() {
		return buyPrice;
	}

	public void setBuyPrice(Double buyPrice) {
		this.buyPrice = buyPrice;
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

	public String getConfig() {
		return config;
	}

	public void setConfig(String config) {
		this.config = config;
	}

	public List<Map<String, Object>> getMobileBonusList() {
		return mobileBonusList;
	}

	public void setMobileBonusList(List<Map<String, Object>> mobileBonusList) {
		this.mobileBonusList = mobileBonusList;
	}

	public String[] getBonusList() {
		return bonusList;
	}

	public void setBonusList(String[] bonusList) {
		if(bonusList != null && bonusList.length > 0){
			for(int i=0;i < bonusList.length;i++){
				JSONObject jsonObject = JSONObject.fromObject(bonusList[i]);
				
				Map<String, Object> mobileBonus = (Map<String, Object>) jsonObject.toBean(jsonObject, HashMap.class);
				
				mobileBonusList.add(mobileBonus);
			}
		}
		this.bonusList = bonusList;
	}
	
}
