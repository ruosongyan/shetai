package com.shetai.entity;

import java.sql.Date;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="photo")
public class Photo {
	@Id
	private String pid;
	private String uid;  	//用户id
	private String did;		//医生id
	private String tid;		//照片对应症状类型id（刚上传时为空，由医生判定类别后添加）
	private String position;
	private int photo_type;
	private Date upload_date;
	private int time;		//时间段
	public String getPid() {
		return pid;
	}
	public void setPid(String pid) {
		this.pid = pid;
	}
	public String getUid() {
		return uid;
	}
	public void setUid(String uid) {
		this.uid = uid;
	}
	public String getDid() {
		return did;
	}
	public void setDid(String did) {
		this.did = did;
	}
	public String getTid() {
		return tid;
	}
	public void setTid(String tid) {
		this.tid = tid;
	}
	public String getPosition() {
		return position;
	}
	public void setPosition(String position) {
		this.position = position;
	}
	public int getPhoto_type() {
		return photo_type;
	}
	public void setPhoto_type(int photo_type) {
		this.photo_type = photo_type;
	}
	public Date getUpload_date() {
		return upload_date;
	}
	public void setUpload_date(Date upload_date) {
		this.upload_date = upload_date;
	}
	public int getTime() {
		return time;
	}
	public void setTime(int time) {
		this.time = time;
	}
}
