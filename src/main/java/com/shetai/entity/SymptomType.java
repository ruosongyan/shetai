package com.shetai.entity;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="symptom_type")
public class SymptomType {
	@Id
	private String tid;
	private String uperid;
	private String tname;
	private String description;
	public String getTid() {
		return tid;
	}
	public void setTid(String tid) {
		this.tid = tid;
	}
	public String getUperid() {
		return uperid;
	}
	public void setUperid(String uperid) {
		this.uperid = uperid;
	}
	public String getTname() {
		return tname;
	}
	public void setTname(String tname) {
		this.tname = tname;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
}
