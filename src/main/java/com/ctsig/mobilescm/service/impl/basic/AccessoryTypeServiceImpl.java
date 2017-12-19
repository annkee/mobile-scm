package com.ctsig.mobilescm.service.impl.basic;

import com.ctsig.mobilescm.dao.basic.AccessoryTypeDao;
import com.ctsig.mobilescm.domain.basic.AccessoryType;
import com.ctsig.mobilescm.service.inter.basic.AccessoryTypeService;
import com.ctsig.mobilescm.tool.BaseTool;
import com.ctsig.mobilescm.tool.StringTool;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;


/**
 *
 */
@Service
public class AccessoryTypeServiceImpl implements AccessoryTypeService {
	
	@Resource
	private AccessoryTypeDao dao;

	@Override
	public List<AccessoryType> getAccessoryTypeList(AccessoryType accessoryType) {
		Map<String, Object> param = new LinkedHashMap<>();
		if(accessoryType != null){
			if(StringTool.isNotEmpty(accessoryType.getId())){
				param.put("id", accessoryType.getId());
			}
			if(StringTool.isNotEmpty(accessoryType.getName())){
				param.put("name", "%"+accessoryType.getName()+"%");
			}
			if(StringTool.isNotEmpty(accessoryType.getBrand())){
				param.put("brand", accessoryType.getBrand());
			}
		}
		return dao.queryList(param);
	}

	@Override
	public AccessoryType getAccessoryType(AccessoryType accessoryType) {
		List<AccessoryType> list = getAccessoryTypeList(accessoryType);
		if(BaseTool.isCollectionNotNull(list)){
			return list.get(0);
		}
		return null;
	}

	@Override
	public void addAccessoryType(AccessoryType accessoryType) {
		dao.add(accessoryType);
	}

	@Override
	public void editAccessoryType(AccessoryType accessoryType) {
		dao.edit(accessoryType);
	}

	@Override
	public void deleteAccessoryType(AccessoryType accessoryType) {
		dao.delete(accessoryType);
	}
	
	
	
}
