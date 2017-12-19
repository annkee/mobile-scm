package com.ctsig.mobilescm.service.inter.basic;

import com.ctsig.mobilescm.domain.basic.Supplier;

import java.util.List;


/**
 *
 */
public interface SupplierService {

	List<Supplier> getSupplierList(Supplier supplier);

	Supplier getSupplier(Supplier supplier);

	void deleteSupplier(Supplier supplier);

	boolean addSupplier(Supplier supplier);

	void editSupplier(Supplier supplier);

}
