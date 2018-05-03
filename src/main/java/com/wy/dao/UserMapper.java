package com.wy.dao;

import com.wy.pojo.User;

public interface UserMapper {
	
	public User findUserByName(String username);
}
