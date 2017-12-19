package com.ctsig.mobilescm.service.inter.basic;

import com.ctsig.mobilescm.domain.basic.Account;

import java.util.List;


/**
 *
 */
public interface AccountService {

	List<Account> getAccountTypeList(Account account);

	Account getAccount(Account account);

	void addAccount(Account account);

	void editAccount(Account account);

	void deleteAccount(Account account);
	
}
