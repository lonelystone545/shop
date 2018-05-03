package com.wy.dao;

import java.util.List;

import com.wy.pojo.AccountItem;

public interface AccountMapper {
	
	public List<AccountItem> showAccounts(String username);
	
}
