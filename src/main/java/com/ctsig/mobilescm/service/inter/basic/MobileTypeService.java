package com.ctsig.mobilescm.service.inter.basic;

import com.ctsig.mobilescm.domain.basic.MobileType;
import com.ctsig.mobilescm.domain.system.Page;

import java.util.List;


/**
 */
public interface MobileTypeService {

	List<MobileType> getMobileTypeList(MobileType mobileType, Page page);

	int getTotalSize(MobileType mobileType);
	
	MobileType getMobile(MobileType mobileType);

	boolean addMobileType(MobileType mobileType);

	void deleteMobileType(MobileType mobileType);

	void editMobileType(MobileType mobileType);
	
	
	
}
