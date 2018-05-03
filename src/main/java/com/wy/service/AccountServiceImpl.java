package com.wy.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wy.dao.AccountMapper;
import com.wy.pojo.AccountItem;

@Service
public class AccountServiceImpl implements AccountService {


	@Autowired
	private AccountMapper accountMapper;
	
	@Override
	public List<AccountItem> showAccounts(String username) {
		return accountMapper.showAccounts(username);
	}
	
}
