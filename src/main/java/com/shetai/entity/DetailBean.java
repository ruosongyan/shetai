package com.shetai.entity;

import java.sql.Date;

public class DetailBean {
	private String sender_id;
	private String receive_id;
	private String pid;    //照片id
	private String content;
	private Date time;
	private String sender_name;
	private String receive_name;
	private int sender_type;
	private int receive_type;
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
	public Date getTime() {
		return time;
	}
	public void setTime(Date time) {
		this.time = time;
	}
	public String getSender_name() {
		return sender_name;
	}
	public void setSender_name(String sender_name) {
		this.sender_name = sender_name;
	}
	public String getReceive_name() {
		return receive_name;
	}
	public void setReceive_name(String receive_name) {
		this.receive_name = receive_name;
	}
	public int getSender_type() {
		return sender_type;
	}
	public void setSender_type(int sender_type) {
		this.sender_type = sender_type;
	}
	public int getReceive_type() {
		return receive_type;
	}
	public void setReceive_type(int receive_type) {
		this.receive_type = receive_type;
	}
}
