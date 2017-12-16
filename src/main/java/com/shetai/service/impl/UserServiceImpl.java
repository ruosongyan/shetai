package com.shetai.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shetai.dao.impl.UserDaoImpl;
import com.shetai.entity.User;
import com.shetai.service.UserService;

@Service
public class UserServiceImpl extends BaseServiceImpl<UserDaoImpl,User> implements UserService{
	@Autowired
	private UserDaoImpl userDao;
	
	public boolean validateLogin(String account,String passwd) {
		User user = new User();
		user.setAccount(account);
		user.setPasswd(passwd);
		return userDao.queryByLoginInfo(user);
	}
}
