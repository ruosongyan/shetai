package com.shetai.utils;

import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;

import com.shetai.entity.DetailBean;
import com.shetai.entity.Message;
import com.shetai.entity.User;
import com.shetai.service.MessageService;
import com.shetai.service.UserService;

public class Utils {
	
	@Autowired
	private static UserService userService;
	@Autowired
	private static MessageService messageService;
	
	/**
	 * 封装JDK自带的UUID, 通过Random数字生成, 中间无-分割.
	 */
	public static String uuid() {
		return UUID.randomUUID().toString().replaceAll("-", "");
	}
	
	public static DetailBean messageToDetailBean(Message message) {
		DetailBean detailBean=new DetailBean();
		detailBean.setPid(message.getPid());
		detailBean.setReceive_id(message.getReceive_id());
		detailBean.setSender_id(message.getSender_id());
		detailBean.setContent(message.getContent());
		detailBean.setTime(message.getTime());
		User sender=userService.query("User",message.getSender_id());
		User receiver=userService.query("User",message.getReceive_id());
		String sname=sender.getUname();
		String rname=receiver.getUname();
		int stype=sender.getType();
		int rtype=receiver.getType();
		detailBean.setSender_name(sname);
		detailBean.setReceive_name(rname);
		detailBean.setSender_type(stype);
		detailBean.setReceive_type(rtype);
		return detailBean;
	}
}
