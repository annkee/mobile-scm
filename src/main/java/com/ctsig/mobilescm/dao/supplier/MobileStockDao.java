package com.ctsig.mobilescm.dao.supplier;


import com.ctsig.mobilescm.domain.supplier.MobileStock;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;


/**
 *
 */
public interface MobileStockDao {

    void add(@Param("mobileStockList") List<MobileStock> mobileStockList);

    void edit(@Param("params") Map<String, Object> params);

    void delete(@Param("params") Map<String, Object> params);


}
