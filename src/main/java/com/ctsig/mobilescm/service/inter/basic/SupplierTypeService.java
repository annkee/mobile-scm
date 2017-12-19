package com.ctsig.mobilescm.service.inter.basic;

import com.ctsig.mobilescm.domain.basic.SupplierType;

import java.util.List;


/**
 *
 */
public interface SupplierTypeService {
	
	
	List<SupplierType> getSupplierTypeList(SupplierType supplierType);
	
	SupplierType getSupplierType(SupplierType supplierType);

	boolean addSupplierType(SupplierType supplierType);

	void editSupplierType(SupplierType supplierType);

	void deleteSupplierType(SupplierType supplierType);

}
