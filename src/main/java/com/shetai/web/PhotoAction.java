package com.shetai.web;

import java.text.SimpleDateFormat;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.shetai.entity.Photo;
import com.shetai.service.PhotoService;

import net.sf.json.JSONArray;
import net.sf.json.JsonConfig;
import net.sf.json.processors.JsonValueProcessor;

public class PhotoAction extends BaseAction{
	@Autowired
	private PhotoService photoService;
	private String result;
	public String execute() {
		List<Photo> list=photoService.query("Photo");
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
		System.out.println(result);
		return "success";
	}
	
	public String sendMessage() {
		
		return "success";
	}
	public String getResult() {
		return result;
	}
	public void setResult(String result) {
		this.result = result;
	}
}
