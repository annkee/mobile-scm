package com.ctsig.mobilescm.dao.basic;

import com.ctsig.mobilescm.domain.basic.Customer;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;


/**
 *
 */
public interface CustomerDao {

    List<Customer> queryList(@Param("params") Map<String, Object> params);

    int queryCount(@Param("params") Map<String, Object> params);

    void add(@Param("customer") Customer customer);

    void edit(@Param("params") Map<String, Object> params);

    void delete(@Param("customer") Customer customer);

}
