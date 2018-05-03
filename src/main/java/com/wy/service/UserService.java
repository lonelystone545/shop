package com.wy.service;

import com.wy.pojo.User;

public interface UserService {
	
	//验证用户名 密码是否正确
	public String validateUser(User user);
}
