package com.shetai.web;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.shetai.entity.DetailBean;
import com.shetai.entity.Notice;
import com.shetai.entity.NoticeBean;
import com.shetai.entity.User;
import com.shetai.service.NoticeService;
import com.shetai.service.UserService;

public class NoticeAction extends BaseAction{
	@Autowired
	private UserService userService;
	@Autowired
	private NoticeService noticeService;
	
	private ArrayList<NoticeBean> noticeList;
	
	public String execute() {
		List<Notice> list=noticeService.query("Notice");
		noticeList=new ArrayList<NoticeBean>();
		for(Notice n:list) {
			NoticeBean bean=new NoticeBean();
			bean.setContent(n.getContent());
			bean.setDate(n.getDate());
			bean.setTitle(n.getTitle());
			User entity=new User();
			entity.setUid(n.getUid());
			User user=userService.query("User", entity).get(0);
			if(user!=null) {
				bean.setUname(user.getUname());
			}
			noticeList.add(bean);
		}
		return "success";
	}
	
	public ArrayList<NoticeBean> getNoticeList() {
		return noticeList;
	}
	public void setNoticeList(ArrayList<NoticeBean> noticeList) {
		this.noticeList = noticeList;
	}
}
