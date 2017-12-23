package com.shetai.web;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.shetai.entity.DetailBean;
import com.shetai.entity.Message;
import com.shetai.entity.Notice;
import com.shetai.entity.NoticeBean;
import com.shetai.entity.Photo;
import com.shetai.entity.SymptomType;
import com.shetai.entity.User;
import com.shetai.service.MessageService;
import com.shetai.service.NoticeService;
import com.shetai.service.PhotoService;
import com.shetai.service.SymptomTypeService;
import com.shetai.service.UserService;
import com.shetai.utils.Utils;

@Repository
public class MessageAction extends BaseAction{
	@Autowired
	private MessageService messageService;
	@Autowired
	private PhotoService photoService;
	@Autowired
	private UserService userService;
	@Autowired
	private SymptomTypeService symptomTypeService;
	@Autowired
	private NoticeService noticeService;
	
	private ArrayList<NoticeBean> noticeList;
	private String content;
	private String pid;
	private String sender_id;
	private String receive_id;
	private String pic_path;
	private int time;
	private Date date;


	private ArrayList<DetailBean> detailList;
	private ArrayList<String> typeList;
	private ArrayList<String> photoList;
	
	public String execute() {
		HttpServletRequest reqeust= ServletActionContext.getRequest();  
		pid=reqeust.getParameter("id");
		//回复信息
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
		//图片信息
		Photo p = photoService.getPhoto(pid);
		pic_path = p.getPosition();
		time=p.getTime();
		date=p.getUpload_date();
		typeList=new ArrayList<String>();
		String typeStr=p.getTid();
		if(StringUtils.isNotEmpty(typeStr)) {
			String[] typeArray=typeStr.split(",");
			for(String t:typeArray) {
				SymptomType entity=new SymptomType();
				entity.setTid(t);
				SymptomType st=symptomTypeService.query("SymptomType", entity).get(0);
				if(st!=null) {
					typeList.add(st.getTname());
				}
			}
		}
		photoList=new ArrayList<String>();
		String photoStr=p.getPosition();
		if(StringUtils.isNotEmpty(photoStr)) {
			String[] photoArray=photoStr.split(",");
			for(String photo:photoArray) {
				photoList.add(photo);
			}
		}
		//Notice
		List<Notice> nlist=noticeService.query("Notice");
		noticeList=new ArrayList<NoticeBean>();
		for(Notice n:nlist) {
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
	public String getPic_path() {
		return pic_path;
	}


	public void setPic_path(String pic_path) {
		this.pic_path = pic_path;
	}


	public int getTime() {
		return time;
	}


	public void setTime(int time) {
		this.time = time;
	}


	public Date getDate() {
		return date;
	}


	public void setDate(Date date) {
		this.date = date;
	}


	public ArrayList<String> getTypeList() {
		return typeList;
	}


	public void setTypeList(ArrayList<String> typeList) {
		this.typeList = typeList;
	}


	public ArrayList<String> getPhotoList() {
		return photoList;
	}


	public void setPhotoList(ArrayList<String> photoList) {
		this.photoList = photoList;
	}


	public ArrayList<NoticeBean> getNoticeList() {
		return noticeList;
	}


	public void setNoticeList(ArrayList<NoticeBean> noticeList) {
		this.noticeList = noticeList;
	}
}
