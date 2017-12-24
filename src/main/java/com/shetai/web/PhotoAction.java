package com.shetai.web;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.shetai.entity.Message;
import com.shetai.entity.Notice;
import com.shetai.entity.NoticeBean;
import com.shetai.entity.Photo;
import com.shetai.entity.User;
import com.shetai.service.MessageService;
import com.shetai.service.NoticeService;
import com.shetai.service.PhotoService;
import com.shetai.service.UserService;

import net.sf.json.JSONArray;
import net.sf.json.JsonConfig;
import net.sf.json.processors.JsonValueProcessor;

@Repository
public class PhotoAction extends BaseAction{
	@Autowired
	private UserService userService;
	@Autowired
	private PhotoService photoService;
	@Autowired
	private MessageService messageService;
	@Autowired
	private NoticeService noticeService;
	
	private ArrayList<NoticeBean> noticeList;
	private String pid;
	private String result;
	private int time;
	private Date date;
	private File file1;
	private File file2;
	private File file3;
	private String pic_path1;
	private String pic_path2;
	private String pic_path3;
	private String picpos;
	private String picnum;
	private String sign;

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
	
	public String listPhoto() {
		Photo entity=new Photo();
		entity.setUid((String) session.get("id"));
		List<Photo> list=photoService.query("Photo",entity);
		JsonConfig jsonConfig = new JsonConfig();
		jsonConfig.registerJsonValueProcessor(java.sql.Date.class,new JsonValueProcessor() {
           private final String format="yyyy-MM-dd";
           public Object processObjectValue(String key, Object value,JsonConfig arg2){
             if(value==null)
                   return "";
             if (value instanceof java.sql.Date) {
                   String str = new SimpleDateFormat(format).format((java.sql.Date) value);
                   return str;
             }
                   return value.toString();
           }
     
           public Object processArrayValue(Object value, JsonConfig arg1){
                      return null;
           }
           
        });
		JSONArray jsonArray = JSONArray.fromObject(list,jsonConfig); 
		result=jsonArray.toString();
		return "success";
	}

	public String deletePhoto() {
		Photo entity=new Photo();
		entity.setPid(pid);
		Photo photo=photoService.query("Photo", entity).get(0);
		photoService.delete(photo);
		//删除对应的回复
		Message mentity=new Message();
		mentity.setPid(pid);
		List<Message> mlist=messageService.query("Message",mentity);
		for(Message m:mlist) {
			messageService.delete(m);
		}
		return "success";
	}
	
	public String editPage() {
		HttpServletRequest reqeust= ServletActionContext.getRequest();  
		pid=reqeust.getParameter("id");
		session.put("pid", pid);
		
		Photo p = photoService.getPhoto(pid);
		String[] pic_path = p.getPosition().split(",");
		picnum = String.valueOf(pic_path.length);
		
		pic_path1 = "";
		pic_path2 = "";
		pic_path3 = "";
		if(pic_path.length == 1) {
			pic_path1 = pic_path[0];
		}
		else if(pic_path.length == 2) {
			pic_path1 = pic_path[0];
			pic_path2 = pic_path[1];
		}
		else if(pic_path.length == 3){
			pic_path1 = pic_path[0];
			pic_path2 = pic_path[1];
			pic_path3 = pic_path[2];	
		}
		else {
			
		}
		time = p.getTime();
		date = p.getUpload_date();
		
		//Notice
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
	
	public String editPhoto() throws IOException {
		String path="";
		String[] sign_str=sign.split(",");
		
		int num = Integer.parseInt(picnum);
		
		if(sign_str[0].equals("0")) {
				path+=(pic_path1+",");
		}
		else if(sign_str[0].equals("2")) {
			path+=(photoService.uploadpic(file1,(String) session.get("id"),time, date)+",");
		}
		else {
			
		}
		
		if(sign_str[1].equals("0")) {
			path+=(pic_path2+",");
		}
		else if(sign_str[1].equals("2")) {
			path+=(photoService.uploadpic(file2,(String) session.get("id"),time, date)+",");
		}
		else {
			
		}
		
		if(sign_str[2].equals("0")) {
			path+=pic_path3+",";
		}
		else if(sign_str[2].equals("2")) {
			path+=photoService.uploadpic(file3,(String) session.get("id"),time, date)+",";
		}
		else {
			
		}
		path = path.substring(0, path.length()-1);
		
		Photo p = new Photo();
		p.setPid((String) session.get("pid"));
		System.out.println("New Pid : "+(String) session.get("pid"));
		p.setUid((String) session.get("id"));
		p.setPhoto_type(0);
		p.setDid("");
		p.setPosition(path);
		p.setTime(time);
		p.setUpload_date(date);
		
		photoService.update(p);
		
		return "success";
	}
	
	public String getResult() {
		return result;
	}
	public void setResult(String result) {
		this.result = result;
	}

	public String getPid() {
		return pid;
	}

	public void setPid(String pid) {
		this.pid = pid;
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

	public String getSign() {
		return sign;
	}

	public void setSign(String sign) {
		this.sign = sign;
	}

	public ArrayList<NoticeBean> getNoticeList() {
		return noticeList;
	}

	public void setNoticeList(ArrayList<NoticeBean> noticeList) {
		this.noticeList = noticeList;
	}
	public String getPic_path1() {
		return pic_path1;
	}

	public void setPic_path1(String pic_path1) {
		this.pic_path1 = pic_path1;
	}

	public String getPic_path2() {
		return pic_path2;
	}

	public void setPic_path2(String pic_path2) {
		this.pic_path2 = pic_path2;
	}

	public String getPic_path3() {
		return pic_path3;
	}

	public void setPic_path3(String pic_path3) {
		this.pic_path3 = pic_path3;
	}
	public File getFile1() {
		return file1;
	}

	public void setFile1(File file1) {
		this.file1 = file1;
	}
	public File getFile2() {
		return file2;
	}

	public void setFile2(File file2) {
		this.file2 = file2;
	}

	public File getFile3() {
		return file3;
	}

	public void setFile3(File file3) {
		this.file3 = file3;
	}
	public String getPicnum() {
		return picnum;
	}

	public void setPicnum(String picnum) {
		this.picnum = picnum;
	}

	public String getPicpos() {
		return picpos;
	}

	public void setPicpos(String picpos) {
		this.picpos = picpos;
	}

}
