package com.shetai.dao.impl;

import java.util.List;

import org.hibernate.Query;
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
	public boolean queryByLoginInfo(User user) {
		Session session=sessionFactory.openSession();   
    	String hql="from User where account=:account and passwd=:passwd";
		Query query = session.createQuery(hql);
		query.setString("account",user.getAccount());
		query.setString("passwd",user.getPasswd());
		List<User> list=query.list();
		session.close(); 
		if(list.size()!=0) {
			return true;
		}else {
			return false;
		}
	}
}
