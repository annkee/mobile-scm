package com.ctsig.mobilescm.service.impl.basic;

import com.ctsig.mobilescm.dao.basic.CustomerDao;
import com.ctsig.mobilescm.dao.basic.CustomerTypeDao;
import com.ctsig.mobilescm.domain.basic.CustomerType;
import com.ctsig.mobilescm.service.inter.basic.CustomerTypeService;
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
@Service("customerTypeService")
public class CustomerTypeServiceImpl implements CustomerTypeService {
	
	@Resource(name="customerTypeDao")
	private CustomerTypeDao dao;
	
	@Resource(name="customerDao")
	private CustomerDao customerDao;

	public List<CustomerType> getCustomerTypeList(CustomerType customerType) {
		Map<String, Object> params = new LinkedHashMap<>();
		if(customerType != null && StringTool.isNotEmpty(customerType.getId())){
			params.put("id", customerType.getId());
		}
		return dao.queryList(params);
	}

	@Override
	public CustomerType getCustomerType(CustomerType customerType) {
		List<CustomerType> list = getCustomerTypeList(customerType);
		if(BaseTool.isCollectionNotNull(list)){
			return list.get(0);
		}
		return null;
	}

	@Override
	public void addCustomerType(CustomerType customerType) {
		dao.add(customerType);
	}

	@Override
	public void editCustomerType(CustomerType customerType) {
		dao.edit(customerType);
	}

	@Override
	public void deleteCustomerType(CustomerType customerType) {
		//TODO 将客户的客户类别清空
		Map<String, Object> params = new LinkedHashMap<>();
		params.put("customerTypeIdKey", customerType.getId());
		customerDao.edit(params);
		//删除类别
		dao.delete(customerType);
	}
	
	
	
}
