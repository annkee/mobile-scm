package com.ctsig.mobilescm.service.impl.supplier;

import com.ctsig.mobilescm.dao.supplier.TradeDetailDao;
import com.ctsig.mobilescm.domain.supplier.TradeDetail;
import com.ctsig.mobilescm.service.inter.supplier.TradeDetailService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;


/**
 *
 */
@Service
public class TradeDetailServiceImpl implements TradeDetailService {

	@Resource
	private TradeDetailDao dao;
	
	@Override
	public List<TradeDetail> getTradeDetailList(Map<String, Object> params) {
		
		return dao.queryList(params);
	}

	
	
	
}
