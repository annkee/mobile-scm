package com.ctsig.mobilescm.dao.supplier;

import com.ctsig.mobilescm.domain.supplier.MobileReturn;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 *
 */
public interface MobileReturnDao {

    List<MobileReturn> queryList(@Param("params") Map<String, Object> params);

    int queryCount(@Param("params") Map<String, Object> params);

    void edit(@Param("params") Map<String, Object> params);

    void add(@Param("mobileReturn") MobileReturn mobileReturn);

    void addMobileReturnNumber(@Param("serialNumberList") List<Map<String, String>> serialNumberList);


}
