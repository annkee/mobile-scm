package com.ctsig.mobilescm.service.impl.system;

import com.ctsig.mobilescm.dao.system.ActionDao;
import com.ctsig.mobilescm.domain.system.Action;
import com.ctsig.mobilescm.service.inter.system.ActionService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;


/**
 *
 */
@Service
public class ActionServiceImpl implements ActionService {
	
	@Resource
	private ActionDao actionDao;
	
	public List<Action> getActionList(Action action) {
		List<Action> list = actionDao.getActionList(action);
		
		return list;
	}

	public Action getAction(Action action) {
		return actionDao.getAction(action);
	}

	public void editAction(Action action) {
		
		actionDao.editAction(action);
	}

	public void deleteAction(Action action) {
		actionDao.deleteAction(action);
	}

	public void addAction(Action action) {
		actionDao.addAction(action);
	}

}
