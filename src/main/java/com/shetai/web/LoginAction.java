package com.shetai.web;

import java.util.List;

import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.shetai.entity.User;
import com.shetai.service.UserService;
import com.shetai.utils.Utils;

@Repository
public class LoginAction extends BaseAction{
	@Autowired
	private UserService userService;
	
	private String account;
	private String passwd;
	
	public String execute() {
		
		return "success";
	}
	
	public String login() {
		User u=null;
		if((u=userService.validateLogin(account, passwd))!=null) {
			session.put("id", u.getUid());
			return "success";
		}else {
			return "fail";
		}
	}
	
	public String register() {
		User user=new User();
		user.setAccount(account);
		List<User> list=userService.query("User", user);
		if(list.size()==0) {
			user.setUid(Utils.uuid());
			user.setPasswd(passwd);
			userService.add(user);
			return "success";
		}else {
			return "fail";
		}
		
	}

	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	public String getPasswd() {
		return passwd;
	}

	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
}
