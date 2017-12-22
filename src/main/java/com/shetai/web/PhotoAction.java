package com.shetai.web;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;

import com.shetai.entity.Message;
import com.shetai.entity.Photo;
import com.shetai.service.MessageService;
import com.shetai.service.PhotoService;

import net.sf.json.JSONArray;
import net.sf.json.JsonConfig;
import net.sf.json.processors.JsonValueProcessor;

public class PhotoAction extends BaseAction{
	@Autowired
	private PhotoService photoService;
	@Autowired
	private MessageService messageService;
	private String pid;
	private String result;
	private String pic_path;
	private String sign;
	private int time;
	private Date date;
	private File file;
	
	public String execute() {
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
	
	public File getFile() {
		return file;
	}

	public void setFile(File file) {
		this.file = file;
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
		System.out.println("Original Pid : "+pid);
		
		Photo p = photoService.getPhoto(pid);
		pic_path = p.getPosition();
		time = p.getTime();
		date = p.getUpload_date();
		
		return "success";
	}
	
	public String editPhoto() throws IOException {
		String path="";
		System.out.println(sign);
		if(sign.equals("1")) {
			path=photoService.uploadpic(file,(String) session.get("id"),time, date);
		}else {
			path=pic_path;
		}
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

	public String getSign() {
		return sign;
	}

	public void setSign(String sign) {
		this.sign = sign;
	}

}
