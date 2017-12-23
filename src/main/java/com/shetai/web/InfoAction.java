package com.shetai.web;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.shetai.dao.impl.UserDaoImpl;
import com.shetai.entity.Notice;
import com.shetai.entity.NoticeBean;
import com.shetai.entity.User;
import com.shetai.service.NoticeService;
import com.shetai.service.UserService;

@Repository
public class InfoAction extends BaseAction{
	@Autowired
	private UserService userService;
	@Autowired
	private NoticeService noticeService;
	
	private ArrayList<NoticeBean> noticeList;
	
	private String name;
	private int gender;
	private String age;
	private String job;
	private String medicalHistory;
	private String symptom;
	
	public String execute() {
		String uid=(String) session.get("id");
		User entity=new User();
		entity.setUid(uid);
		User user=userService.query("User", entity).get(0);
		name=user.getUname();
		gender=user.getGender();
		age=user.getAge().toString();
		job=user.getJob();
		medicalHistory=user.getMedical_history();
		symptom=user.getSymptom();
		//notice
		List<Notice> list=noticeService.query("Notice");
		noticeList=new ArrayList<NoticeBean>();
		for(Notice n:list) {
			NoticeBean bean=new NoticeBean();
			bean.setContent(n.getContent());
			bean.setDate(n.getDate());
			bean.setTitle(n.getTitle());
			if(user!=null) {
				bean.setUname(user.getUname());
			}
			noticeList.add(bean);
		}
		return "success";
	}

	public String modifyInfo() {
		String uid=(String) session.get("id");
		User entity=new User();
		entity.setUid(uid);
		User user=userService.query("User", entity).get(0);
		user.setUname(name);
		user.setGender(gender);
		user.setAge(Integer.parseInt(age));
		user.setJob(job);
		user.setMedical_history(medicalHistory);
		user.setSymptom(symptom);
		userService.update(user);
		return "success";
	}
	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getGender() {
		return gender;
	}

	public void setGender(int gender) {
		this.gender = gender;
	}

	public String getAge() {
		return age;
	}

	public void setAge(String age) {
		this.age = age;
	}

	public String getMedicalHistory() {
		return medicalHistory;
	}

	public void setMedicalHistory(String medicalHistory) {
		this.medicalHistory = medicalHistory;
	}

	public String getSymptom() {
		return symptom;
	}

	public void setSymptom(String symptom) {
		this.symptom = symptom;
	}

	public String getJob() {
		return job;
	}

	public void setJob(String job) {
		this.job = job;
	}

	public ArrayList<NoticeBean> getNoticeList() {
		return noticeList;
	}

	public void setNoticeList(ArrayList<NoticeBean> noticeList) {
		this.noticeList = noticeList;
	}
}
