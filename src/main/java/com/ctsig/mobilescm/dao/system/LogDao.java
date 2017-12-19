package com.ctsig.mobilescm.dao.system;

import com.ctsig.mobilescm.domain.system.Log;

import java.util.List;
import java.util.Map;


/**
 *
 */
public interface LogDao {
	
	void addLog(Log log);

	List<Log> getLogList(Map<String, Object> param);
	
	void deleteLog(Map<String, Object> params);

	int getTotal(Map<String, Object> param);
}
