package com.ctsig.mobilescm.service.inter.basic;

import com.ctsig.mobilescm.domain.basic.Customer;
import com.ctsig.mobilescm.domain.system.Page;

import java.util.List;


/**
 *
 */
public interface CustomerService {

	List<Customer> getCustomerList(Customer customer, Page page);

	Customer getCustomer(Customer customer);

	boolean addCustomer(Customer customer);

	void editCustomer(Customer customer);

	void deleteCustomer(Customer customer);

	int getTotalSize(Customer customer);
	
}
