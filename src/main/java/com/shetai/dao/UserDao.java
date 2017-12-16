package com.shetai.dao;

import com.shetai.entity.User;

public interface UserDao {
	public boolean queryByLoginInfo(User user);
}
