package com.wy.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wy.dao.UserMapper;
import com.wy.pojo.User;

@Service
public class UserServiceImpl implements UserService {
	
//	@Autowired
//	private UserMapper userMapper;

	private static String ERROR_MESSAGE = "用户名或者密码错误";
	private static String BUY_PASSWORD = "37254660e226ea65ce6f1efd54233424";
	private static String SELL_PASSWORD = "981c57a5cfb0f868e064904b8745766f";
	@Override
	public String validateUser(User user) {
		if("buyer".equals(user.getUsername()) && BUY_PASSWORD.equals(user.getPassword())) {
			return null;
		} else if("seller".equals(user.getUsername()) && SELL_PASSWORD.equals(user.getPassword())) {
			return null;
		} else {
			return ERROR_MESSAGE;
		}
	}

}
