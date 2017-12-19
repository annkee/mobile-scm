package com.ctsig.mobilescm.service.inter.basic;

import com.ctsig.mobilescm.domain.basic.BonusType;

import java.util.List;


/**
 *
 */
public interface BonusTypeService {
	
	List<BonusType> getBonusTypeList(BonusType bonusType);

	void addBonusType(BonusType bonusType);

	void deleteBonusType(BonusType bonusType);

	void editBonusType(BonusType bonusType);

	BonusType getBonusType(BonusType bonusType);
	
}
