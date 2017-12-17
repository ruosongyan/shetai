package com.shetai.web;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;

import com.shetai.entity.DetailBean;
import com.shetai.entity.Message;
import com.shetai.entity.User;
import com.shetai.service.MessageService;
import com.shetai.service.UserService;
import com.shetai.utils.Utils;

public class MessageAction extends BaseAction{
	@Autowired
	private MessageService messageService;
	@Autowired
	private UserService userService;
	private String content;
	private String pid;
	private String sender_id;
	private String receive_id;
	
	private ArrayList<DetailBean> detailList;
	
	public String execute() {
		HttpServletRequest reqeust= ServletActionContext.getRequest();  
		pid=reqeust.getParameter("id");
		System.out.println(pid);
		Message message = new Message();
		message.setPid(pid);
		ArrayList<Message> list=(ArrayList<Message>) messageService.query("Message",message);
		detailList=new ArrayList<DetailBean>();
		for(Message entity:list) {
			DetailBean detailBean=new DetailBean();
			detailBean.setPid(entity.getPid());
			detailBean.setReceive_id(entity.getReceive_id());
			detailBean.setSender_id(entity.getSender_id());
			detailBean.setContent(entity.getContent());
			detailBean.setTime(entity.getTime());
			User u=new User();
			u.setUid(entity.getSender_id());
			User sender=userService.query("User",u).get(0);
			u.setUid(entity.getReceive_id());
			User receiver=userService.query("User",u).get(0);
			String sname=sender.getUname();
			String rname=receiver.getUname();
			int stype=sender.getType();
			int rtype=receiver.getType();
			detailBean.setSender_name(sname);
			detailBean.setReceive_name(rname);
			detailBean.setSender_type(stype);
			detailBean.setReceive_type(rtype);
			detailList.add(detailBean);
		}
		return "success";
	}
	
	
	public String sendMessage() {
		Message message=new Message();
		message.setMid(Utils.uuid());
		message.setContent(content);
		message.setPid(pid);
		message.setReceive_id(receive_id);
		message.setSender_id(sender_id);
		Date date = new Date();
		java.sql.Date sqlDate=new java.sql.Date(date.getTime());
		message.setTime(sqlDate);
		messageService.add(message);
		return "success";
	}


	public ArrayList<DetailBean> getDetailList() {
		return detailList;
	}


	public void setDetailList(ArrayList<DetailBean> detailList) {
		this.detailList = detailList;
	}


	public String getPid() {
		return pid;
	}


	public void setPid(String pid) {
		this.pid = pid;
	}


	public String getContent() {
		return content;
	}


	public void setContent(String content) {
		this.content = content;
	}


	public String getSender_id() {
		return sender_id;
	}


	public void setSender_id(String sender_id) {
		this.sender_id = sender_id;
	}


	public String getReceive_id() {
		return receive_id;
	}


	public void setReceive_id(String receive_id) {
		this.receive_id = receive_id;
	}
}
