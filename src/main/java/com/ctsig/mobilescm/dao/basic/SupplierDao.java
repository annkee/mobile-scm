package com.ctsig.mobilescm.dao.basic;

import com.ctsig.mobilescm.domain.basic.Supplier;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;


/**
 * 供应商
 */
public interface SupplierDao {

    List<Supplier> queryList(@Param("params") Map<String, Object> params);

    void add(@Param("supplier") Supplier supplier);

    void edit(@Param("params") Map<String, Object> params);

    void delete(@Param("supplier") Supplier supplier);

}
