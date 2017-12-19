package com.ctsig.mobilescm.dao.basic;

import com.ctsig.mobilescm.domain.basic.Account;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;


/**
 *
 */
public interface AccountDao {

    List<Account> queryList(@Param("param") Map<String, Object> param);

    void add(@Param("account") Account account);

    void edit(@Param("account") Account account);

    void delete(@Param("account") Account account);
}
