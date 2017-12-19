package com.ctsig.mobilescm.dao.basic;

import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 * 
 */
public interface MobileBasicDao {

	List<Map<String, String>> queryList(@Param("params") Map<String, Object> params);

	void delete(@Param("params")Map<String, Object> params);

	void add(@Param("params")Map<String, Object> params);
	
	
	
}
