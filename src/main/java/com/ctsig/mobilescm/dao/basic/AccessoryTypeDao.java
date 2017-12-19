package com.ctsig.mobilescm.dao.basic;

import com.ctsig.mobilescm.domain.basic.AccessoryType;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;


/**
 *
 */
public interface AccessoryTypeDao {
	
	List<AccessoryType> queryList(@Param("param") Map<String, Object> param);
	
	void add(@Param("accessoryType") AccessoryType accessoryType);
	
	void edit(@Param("accessoryType") AccessoryType accessoryType);
	
	void delete(@Param("accessoryType") AccessoryType accessoryType);
}
