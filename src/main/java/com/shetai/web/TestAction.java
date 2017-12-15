package com.shetai.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.shetai.dao.impl.UserDaoImpl;

@Repository
public class TestAction extends BaseAction{
	@Autowired
	private UserDaoImpl userDao;
	
	public String execute() {

		return "fail";
	}
}
