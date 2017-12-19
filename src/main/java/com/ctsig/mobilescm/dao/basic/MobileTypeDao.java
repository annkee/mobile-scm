package com.ctsig.mobilescm.dao.basic;

import com.ctsig.mobilescm.domain.basic.MobileType;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;


/**
 * 手机型号
 */
public interface MobileTypeDao {

	List<MobileType> queryList(@Param("params")Map<String, Object> params);

	MobileType queryObject(@Param("params")Map<String, Object> params);
	
	int queryCount(@Param("params")Map<String, Object> params);
	
	void add(@Param("mobileType")MobileType mobileType);
	
	void edit(@Param("mobileType")MobileType mobileType);

	void delete(@Param("mobileType")MobileType mobileType);

	void addBonus(@Param("bonus") Map<String, Object> bonus);

	void deleteBonus(@Param("mobileType")MobileType mobileType);


	
	
	
}
