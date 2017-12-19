package com.ctsig.mobilescm.service.inter.basic;

import com.ctsig.mobilescm.domain.basic.CustomerType;

import java.util.List;


/**
 *
 */
public interface CustomerTypeService {

	List<CustomerType> getCustomerTypeList(CustomerType customerType);

	CustomerType getCustomerType(CustomerType customerType);

	void addCustomerType(CustomerType customerType);

	void editCustomerType(CustomerType customerType);

	void deleteCustomerType(CustomerType customerType);
	
	
	

}
