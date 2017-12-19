package com.ctsig.mobilescm.dao.basic;

import com.ctsig.mobilescm.domain.basic.BonusType;
import org.apache.ibatis.annotations.Param;

import java.util.List;


/**
 *
 */
public interface BonusTypeDao {

    List<BonusType> queryList(@Param("bonusType") BonusType bonusType);

    void edit(@Param("bonusType") BonusType bonusType);

    void delete(@Param("bonusType") BonusType bonusType);

    void add(@Param("bonusType") BonusType bonusType);

}
