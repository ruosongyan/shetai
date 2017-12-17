package com.shetai.web;

import java.text.SimpleDateFormat;
import java.util.List;

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
	
	public String editPhoto() {
		
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
}
