package com.shetai.dao.impl;

import org.hibernate.Session;  
import org.hibernate.SessionFactory;  
import org.hibernate.Transaction;  
import org.hibernate.cfg.Configuration;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.shetai.dao.UserDao;
import com.shetai.entity.User;  

@Repository
public class UserDaoImpl extends BaseDaoImpl<User> implements UserDao{  
	
}
