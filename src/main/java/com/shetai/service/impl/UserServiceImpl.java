package com.shetai.service.impl;

import org.springframework.stereotype.Service;

import com.shetai.dao.impl.UserDaoImpl;
import com.shetai.entity.User;
import com.shetai.service.UserService;

@Service
public class UserServiceImpl extends BaseServiceImpl<UserDaoImpl,User> implements UserService{

}
