package com.ctsig.mobilescm.service.inter.basic;

import com.ctsig.mobilescm.domain.basic.AccessoryType;

import java.util.List;


/**
 *
 */
public interface AccessoryTypeService {

	List<AccessoryType> getAccessoryTypeList(AccessoryType accessoryType);

	AccessoryType getAccessoryType(AccessoryType accessoryType);

	void addAccessoryType(AccessoryType accessoryType);

	void editAccessoryType(AccessoryType accessoryType);

	void deleteAccessoryType(AccessoryType accessoryType);
	
}
