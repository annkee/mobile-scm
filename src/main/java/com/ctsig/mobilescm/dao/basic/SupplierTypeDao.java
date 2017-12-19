package com.ctsig.mobilescm.dao.basic;

import com.ctsig.mobilescm.domain.basic.SupplierType;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;


/**
 *
 */
public interface SupplierTypeDao {

    List<SupplierType> queryList(@Param("params") Map<String, Object> params);

    void add(@Param("supplierType") SupplierType supplierType);

    void edit(@Param("supplierType") SupplierType supplierType);

    void delete(@Param("supplierType") SupplierType supplierType);


}
