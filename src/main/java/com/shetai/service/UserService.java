package com.shetai.service;

import com.shetai.dao.impl.UserDaoImpl;
import com.shetai.entity.User;

public interface UserService extends BaseService<UserDaoImpl,User>{
	public User validateLogin(String account,String passwd);
}
