package com.wy.service;

import java.util.List;

import com.wy.pojo.AccountItem;

/**
 * 账务
 * @author wy
 *
 */
public interface AccountService {
	
	public List<AccountItem> showAccounts(String username);
}
