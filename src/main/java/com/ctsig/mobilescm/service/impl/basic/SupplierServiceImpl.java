package com.ctsig.mobilescm.service.impl.basic;

import com.ctsig.mobilescm.dao.basic.SupplierDao;
import com.ctsig.mobilescm.domain.basic.Supplier;
import com.ctsig.mobilescm.service.inter.basic.SupplierService;
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
public class SupplierServiceImpl implements SupplierService {
	
	@Resource
	private SupplierDao dao;

	public List<Supplier> getSupplierList(Supplier supplier) {
		Map<String, Object> params = new LinkedHashMap<>();
		if(supplier != null){
			if(StringTool.isNotEmpty(supplier.getName())){
				params.put("name", "%"+supplier.getName()+"%");
			}
			if(StringTool.isNotEmpty(supplier.getId())){
				params.put("id", supplier.getId());
			}
			if(supplier.getSupplierType() != null && StringTool.isNotEmpty(supplier.getSupplierType().getId())){
				params.put("supplierTypeId", supplier.getSupplierType().getId());
			}
		}
		return dao.queryList(params);
	}
	
	public Supplier getSupplier(Supplier supplier) {
		List<Supplier> list = getSupplierList(supplier);
		if(BaseTool.isCollectionNotNull(list)){
			return list.get(0);
		}
		return null;
	}

	public void deleteSupplier(Supplier supplier) {
		dao.delete(supplier);
	}

	public boolean addSupplier(Supplier supplier) {
		List<Supplier> list = getSupplierList(null);
		if(BaseTool.isCollectionNotNull(list)){
			for(Supplier s : list){
				if(s.getId().equalsIgnoreCase(supplier.getId())){
					return false;
				}
			}
		}
		dao.add(supplier);
		return true;
	}

	public void editSupplier(Supplier supplier) {
		Map<String, Object> params = new LinkedHashMap<>();
		params.put("supplier", supplier);
		dao.edit(params);
	}
	
	
	
}
