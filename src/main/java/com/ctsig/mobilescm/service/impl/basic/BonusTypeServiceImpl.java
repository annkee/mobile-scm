package com.ctsig.mobilescm.service.impl.basic;

import com.ctsig.mobilescm.dao.basic.BonusTypeDao;
import com.ctsig.mobilescm.domain.basic.BonusType;
import com.ctsig.mobilescm.service.inter.basic.BonusTypeService;
import com.ctsig.mobilescm.tool.BaseTool;
import com.ctsig.mobilescm.tool.StringTool;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;


/**
 *
 */
@Service
public class BonusTypeServiceImpl implements BonusTypeService {

    @Resource
    private BonusTypeDao dao;

    @Override
    public List<BonusType> getBonusTypeList(BonusType bonusType) {

        return dao.queryList(bonusType);
    }

    @Override
    public void addBonusType(BonusType bonusType) {
        bonusType.setId(StringTool.uniqueKey());
        dao.add(bonusType);
    }

    @Override
    public void deleteBonusType(BonusType bonusType) {
        dao.delete(bonusType);
    }

    @Override
    public void editBonusType(BonusType bonusType) {
        dao.edit(bonusType);
    }

    @Override
    public BonusType getBonusType(BonusType bonusType) {
        List<BonusType> list = getBonusTypeList(bonusType);
        if (BaseTool.isCollectionNotNull(list)) {
            return list.get(0);
        }
        return null;
    }


}
