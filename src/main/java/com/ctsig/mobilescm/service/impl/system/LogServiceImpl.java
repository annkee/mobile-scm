package com.ctsig.mobilescm.service.impl.system;

import com.ctsig.mobilescm.dao.system.LogDao;
import com.ctsig.mobilescm.domain.system.Log;
import com.ctsig.mobilescm.service.inter.system.LogService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;


/**
 *
 */
@Service
public class LogServiceImpl implements LogService {
	
	@Resource
	private LogDao logDao;
	
	public void addLog(Log log) {
		logDao.addLog(log);
	}
	
	public List<Log> getLogList(Map<String, Object> param) {
		
		return logDao.getLogList(param);
	}

	public void deleteLog(Date date) {
		Map<String, Object> param = new LinkedHashMap<>();
		param.put("date", date);
		logDao.deleteLog(param);
	}

	@Override
	public int getTotal(Map<String, Object> param) {
		
		return logDao.getTotal(param);
	}

}
