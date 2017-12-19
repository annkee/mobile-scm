package com.ctsig.mobilescm.dao.supplier;


import com.ctsig.mobilescm.domain.supplier.TradeDetail;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;


/**
 *
 */
public interface TradeDetailDao {

    void add(@Param("tradeDetail") TradeDetail tradeDetail);

    void edit(@Param("params") Map<String, Object> params);

    List<TradeDetail> queryList(@Param("params") Map<String, Object> params);


}
