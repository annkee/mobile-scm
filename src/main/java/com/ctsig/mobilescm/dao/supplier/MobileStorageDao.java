package com.ctsig.mobilescm.dao.supplier;

import com.ctsig.mobilescm.domain.basic.Department;
import com.ctsig.mobilescm.domain.supplier.MobileNumber;
import com.ctsig.mobilescm.domain.supplier.MobileStorage;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 *
 */
public interface MobileStorageDao {

    int queryCount(@Param("params") Map<String, Object> params);

    List<MobileStorage> queryList(@Param("params") Map<String, Object> params);

    List<Map<String, String>> querySerialNumberList(@Param("params") Map<String, Object> params);

    void add(@Param("mobileStorage") MobileStorage mobileStorage);

    void addSerialNumber(@Param("list") List<Map<String, String>> list);

    int querySerialNumber(@Param("params") Map<String, String> params);

    Department getDepartment(@Param("params") Map<String, Object> params);

    void edit(@Param("params") Map<String, Object> params);

    MobileNumber queryMobileNumber(@Param("params") Map<String, String> params);

    void delete(@Param("mobileStorageId") String mobileStorageId);
}
