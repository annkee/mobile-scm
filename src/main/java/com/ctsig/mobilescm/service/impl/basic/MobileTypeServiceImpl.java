package com.ctsig.mobilescm.service.impl.basic;

import com.ctsig.mobilescm.dao.basic.MobileTypeDao;
import com.ctsig.mobilescm.domain.basic.MobileType;
import com.ctsig.mobilescm.domain.system.Page;
import com.ctsig.mobilescm.service.inter.basic.MobileTypeService;
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
public class MobileTypeServiceImpl implements MobileTypeService {
	
	@Resource
	private MobileTypeDao dao;

	@Override
	public List<MobileType> getMobileTypeList(MobileType mobileType, Page page) {
		Map<String, Object> params = new LinkedHashMap<>();
		if(mobileType != null){
			if(StringTool.isNotEmpty(mobileType.getId())){
				params.put("id", mobileType.getId());
			}
			if(StringTool.isNotEmpty(mobileType.getName())){
				params.put("name", "%"+mobileType.getName()+"%");
			}
			if(StringTool.isNotEmpty(mobileType.getBrand())){
				params.put("brand", mobileType.getBrand());
			}
		}
		if(page != null){
			params.put("start", page.getStart());
			params.put("size", page.getPageSize());
		}
		return dao.queryList(params);
	}

	@Override
	public int getTotalSize(MobileType mobileType) {
		Map<String, Object> params = new LinkedHashMap<>();
		if(mobileType != null){
			if(StringTool.isNotEmpty(mobileType.getName())){
				params.put("name", "%"+mobileType.getName()+"%");
			}
			if(StringTool.isNotEmpty(mobileType.getBrand())){
				params.put("brand", mobileType.getBrand());
			}
		}
		return dao.queryCount(params);
	}
	
	@Override
	public MobileType getMobile(MobileType mobileType) {
		Map<String, Object> params = new LinkedHashMap<>();
		if(mobileType != null){
			if(StringTool.isNotEmpty(mobileType.getId())){
				params.put("id", mobileType.getId());
			}
		}
		return dao.queryObject(params);
	}

	@Override
	public boolean addMobileType(MobileType mobileType) {
		if(getMobile(mobileType) != null) {
			return false;
		}
		//添加手机型号
		dao.add(mobileType);
		//添加返利
		for(Map<String, Object> bonus : mobileType.getMobileBonusList()){
			Map<String, Object> params = new LinkedHashMap<>();
			params.put("id", StringTool.uniqueKey());
			params.put("bonusPrice", bonus.get("bonusPrice"));
			params.put("mobileTypeId", mobileType.getId());
			params.put("bonusTypeId", bonus.get("bonusTypeId"));
			dao.addBonus(params);
		}
		return true;
	}

	@Override
	public void deleteMobileType(MobileType mobileType) {
		//删除返利
		dao.deleteBonus(mobileType);
		//删除手机型号
		dao.delete(mobileType);
	}

	@Override
	public void editMobileType(MobileType mobileType) {
		//编辑返利
		dao.deleteBonus(mobileType);
		for(Map<String, Object> bonus : mobileType.getMobileBonusList()){
			Map<String, Object> params = new LinkedHashMap<>();
			params.put("id", StringTool.uniqueKey());
			params.put("bonusPrice", bonus.get("bonusPrice"));
			params.put("mobileTypeId", mobileType.getId());
			params.put("bonusTypeId", bonus.get("bonusTypeId"));
			dao.addBonus(params);
		}
		//编辑型号
		dao.edit(mobileType);
	}

	
	
	
}
