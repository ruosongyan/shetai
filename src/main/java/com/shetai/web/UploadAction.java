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
	private File file1;
	private File file2;
	private File file3;
	private String picpos;
	private String picnum;
	private Date date;
	private int time;
	
	@Override
	public String execute() throws IOException {
		String userid = (String) session.get("id");
		Photo p = new Photo();
		String path="";
		
		System.out.println(picnum);
		int pic_num = Integer.parseInt(picnum);
		System.out.println(picpos);
		
		String[] str=picpos.split(",");

		for(int i=0;i<pic_num;i++) {
			if(i==0) {
				if(str[i].equals("1")) {
					path+=(psi.uploadpic(file1,userid,time,date));
				}
				else if(str[i].equals("2")) {
					path+=(psi.uploadpic(file2,userid,time,date));
				}
				else {
					path+=(psi.uploadpic(file3,userid,time,date));
				}
			}
			else {
				if(str[i].equals("1")) {
					path+=(','+psi.uploadpic(file1,userid,time,date));
				}
				else if(str[i].equals("2")) {
					path+=(','+psi.uploadpic(file2,userid,time,date));
				}
				else {
					path+=(','+psi.uploadpic(file3,userid,time,date));
				}
			}
		}
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
	public String getPicpos() {
		return picpos;
	}

	public void setPicpos(String picpos) {
		this.picpos = picpos;
	}

	public String getPicnum() {
		return picnum;
	}

	public void setPicnum(String picnum) {
		this.picnum = picnum;
	}

}
