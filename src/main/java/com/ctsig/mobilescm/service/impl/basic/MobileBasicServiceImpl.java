package com.ctsig.mobilescm.service.impl.basic;

import com.ctsig.mobilescm.dao.basic.MobileBasicDao;
import com.ctsig.mobilescm.service.inter.basic.MobileBasicService;
import com.ctsig.mobilescm.tool.StringTool;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;


/**
 *
 */
@Service("mobileBasicService")
public class MobileBasicServiceImpl implements MobileBasicService {
	
	@Resource(name="mobileBasicDao")
	private MobileBasicDao dao;

	public List<Map<String, String>> getDataList(String table) {
		Map<String, Object> params = new LinkedHashMap<>();
		params.put("table", table);
		return dao.queryList(params);
	}

	public void deleteData(String table, String id) {
		Map<String, Object> params = new LinkedHashMap<>();
		params.put("table", table);
		params.put("id", id);
		dao.delete(params);
	}

	@Override
	public void addData(String table, String data) {
		Map<String, Object> params = new LinkedHashMap<>();
		params.put("table", table);
		params.put("id", StringTool.uniqueKey());
		params.put("data", data);
		dao.add(params);
	}
	
}
