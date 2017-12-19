package com.ctsig.mobilescm.service.inter.system;

import com.ctsig.mobilescm.domain.system.Log;

import java.util.Date;
import java.util.List;
import java.util.Map;


/**
 *
 */
public interface LogService {

	void addLog(Log log);

	List<Log> getLogList(Map<String, Object> param);

	void deleteLog(Date date);

	int getTotal(Map<String, Object> param);
}
