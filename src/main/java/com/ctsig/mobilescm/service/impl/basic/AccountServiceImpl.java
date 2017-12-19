package com.ctsig.mobilescm.service.impl.basic;

import com.ctsig.mobilescm.dao.basic.AccountDao;
import com.ctsig.mobilescm.domain.basic.Account;
import com.ctsig.mobilescm.service.inter.basic.AccountService;
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
public class AccountServiceImpl implements AccountService {

    @Resource
    private AccountDao dao;

    @Override
    public List<Account> getAccountTypeList(Account account) {
        Map<String, Object> param = new LinkedHashMap<>();
        if (account != null) {
            if (StringTool.isNotEmpty(account.getId())) {
                param.put("id", account.getId());
            }
            if (account.getDepartment() != null && StringTool.isNotEmpty(account.getDepartment().getId())) {
                param.put("departmentId", account.getDepartment().getId());
            }
        }
        return dao.queryList(param);
    }

    @Override
    public Account getAccount(Account account) {
        List<Account> list = getAccountTypeList(account);
        if (BaseTool.isCollectionNotNull(list)) {
            return list.get(0);
        }
        return null;
    }

    @Override
    public void addAccount(Account account) {
        account.setId(StringTool.uniqueKey());
        dao.add(account);
    }

    @Override
    public void editAccount(Account account) {
        dao.edit(account);
    }

    @Override
    public void deleteAccount(Account account) {
        dao.delete(account);
    }

}
