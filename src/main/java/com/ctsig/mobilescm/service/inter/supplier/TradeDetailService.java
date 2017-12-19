package com.ctsig.mobilescm.service.inter.supplier;

import com.ctsig.mobilescm.domain.supplier.TradeDetail;

import java.util.List;
import java.util.Map;


/**
 *
 */
public interface TradeDetailService {

	List<TradeDetail> getTradeDetailList(Map<String, Object> params);
	
	
	
}
