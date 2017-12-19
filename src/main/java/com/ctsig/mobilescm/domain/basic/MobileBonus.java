package com.ctsig.mobilescm.domain.basic;

import java.io.Serializable;

/**
 * 手机返利：	手机型号-返利类别-返利价格
 */
public class MobileBonus implements Serializable {
	
	private static final long serialVersionUID = 7237192370775866633L;

	private String id;
	
	private Double price;
	
	private MobileType mobileType;
	
	private BonusType bonusType;

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

	public MobileType getMobileType() {
		return mobileType;
	}

	public void setMobileType(MobileType mobileType) {
		this.mobileType = mobileType;
	}

	public BonusType getBonusType() {
		return bonusType;
	}

	public void setBonusType(BonusType bonusType) {
		this.bonusType = bonusType;
	}
	
}
