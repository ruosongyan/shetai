package com.shetai.web;

import java.io.File;
import java.io.IOException;
import java.sql.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.shetai.service.PhotoService;

@Repository
public class UploadAction extends BaseAction{
	
	@Autowired
	private PhotoService psi;
	private File file;
	private Date date;
	private int time;
	
	@Override
	public String execute() throws IOException {
		String userid = (String) session.get("id");;
		
		psi.uploadpic(file,userid,time,date);
		
		return SUCCESS;
	}

	public File getFile() {
		return file;
	}

	public void setFile(File file) {
		this.file = file;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public int getTime() {
		return time;
	}

	public void setTime(int time) {
		this.time = time;
	}
}
