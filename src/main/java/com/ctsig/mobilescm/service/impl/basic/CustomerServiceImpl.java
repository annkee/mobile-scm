package com.ctsig.mobilescm.service.impl.basic;

import com.ctsig.mobilescm.dao.basic.CustomerDao;
import com.ctsig.mobilescm.domain.basic.Customer;
import com.ctsig.mobilescm.domain.system.Page;
import com.ctsig.mobilescm.service.inter.basic.CustomerService;
import com.ctsig.mobilescm.tool.BaseTool;
import com.ctsig.mobilescm.tool.StringTool;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;


/**
 *
 */
@Service
public class CustomerServiceImpl implements CustomerService {
	
	@Resource
	private CustomerDao dao;

	@Override
	public List<Customer> getCustomerList(Customer customer, Page page) {
		Map<String, Object> params = new LinkedHashMap<>();
		if(customer != null){
			if(StringTool.isNotEmpty(customer.getId())){
				params.put("id", customer.getId());
			}
			if(customer.getCustomerType() != null && StringTool.isNotEmpty(customer.getCustomerType().getId())){
				params.put("customerTypeId", customer.getCustomerType().getId());
			}
			if(StringTool.isNotEmpty(customer.getName())){
				params.put("name", "%"+customer.getName()+"%");
			}
		}
		if(page != null){
			params.put("start", page.getStart());
			params.put("size", page.getPageSize());
		}
		return dao.queryList(params);
	}

	@Override
	public Customer getCustomer(Customer customer) {
		List<Customer> list = getCustomerList(customer, null);
		if(BaseTool.isCollectionNotNull(list)){
			return list.get(0);
		}
		return null;
	}

	@Override
	public boolean addCustomer(Customer customer) {
		List<Customer> list = getCustomerList(customer, null);
		if(BaseTool.isCollectionNotNull(list)){
			for(Customer c : list){
				if(c.getId().equalsIgnoreCase(customer.getId())){
					return false;
				}
			}
		}
		dao.add(customer);
		return true;
	}

	@Override
	public void editCustomer(Customer customer) {
		Map<String, Object> params = new LinkedHashMap<>();
		params.put("customer", customer);
		dao.edit(params);
	}

	@Override
	public void deleteCustomer(Customer customer) {
		dao.delete(customer);
	}

	@Override
	public int getTotalSize(Customer customer) {
		Map<String, Object> params = new LinkedHashMap<>();
		if(customer != null){
			if(customer.getCustomerType() != null && StringTool.isNotEmpty(customer.getCustomerType().getId())){
				params.put("customerTypeId", customer.getCustomerType().getId());
			}
			if(StringTool.isNotEmpty(customer.getName())){
				params.put("name", "%"+customer.getName()+"%");
			}
		}
		return dao.queryCount(params);
	}
	
	
	
}
