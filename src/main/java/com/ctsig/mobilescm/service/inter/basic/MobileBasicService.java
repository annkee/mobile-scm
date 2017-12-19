package com.ctsig.mobilescm.service.inter.basic;

import java.util.List;
import java.util.Map;

/**
 *
 */
public interface MobileBasicService {

	List<Map<String, String>> getDataList(String table);

	void deleteData(String table, String id);

	void addData(String table, String data);

}
