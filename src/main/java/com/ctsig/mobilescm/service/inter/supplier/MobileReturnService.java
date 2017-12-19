package com.ctsig.mobilescm.service.inter.supplier;

import com.ctsig.mobilescm.domain.supplier.MobileReturn;
import com.ctsig.mobilescm.domain.system.Page;
import com.ctsig.mobilescm.domain.system.User;

import java.util.List;
import java.util.Map;


/**
 *
 */
public interface MobileReturnService {

	int getTotalSize(MobileReturn mobileReturn, User loginUser, String startDate, String endDate);
	
	List<MobileReturn> getMobileReturnList(MobileReturn mobileReturn, User loginUser, String startDate, String endDate, Page page);

	void setCheck(MobileReturn mobileReturn, User loginUser);

	MobileReturn getMobileReturn(Map<String, Object> params);

	void addMobileReturn(MobileReturn mobileReturn, List<String> snList, User loginUser) throws Exception;

	

}
