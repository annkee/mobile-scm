package com.ctsig.mobilescm.dao.basic;

import com.ctsig.mobilescm.domain.basic.CustomerType;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;


/**
 */
public interface CustomerTypeDao {

    List<CustomerType> queryList(@Param("params") Map<String, Object> params);

    void add(@Param("customerType") CustomerType customerType);

    void edit(@Param("customerType") CustomerType customerType);

    void delete(@Param("customerType") CustomerType customerType);


}
