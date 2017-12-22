package com.shetai.web;

import java.io.File;
import java.io.IOException;
import java.sql.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.shetai.entity.Photo;
import com.shetai.service.PhotoService;
import com.shetai.utils.Utils;

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
		
		String path=psi.uploadpic(file,userid,time,date);
		Photo p = new Photo();
		p.setPid(Utils.uuid());
		p.setDid("0");
		p.setPosition(path);
		p.setPhoto_type(0);
		p.setTid(null);
		p.setUpload_date(date);
		p.setUid(userid);
		p.setTime(time);
		psi.add(p);
		
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
