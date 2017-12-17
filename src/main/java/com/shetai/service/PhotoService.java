package com.shetai.service;

import java.io.File;
import java.io.IOException;
import java.sql.Date;

import com.shetai.dao.impl.PhotoDaoImpl;
import com.shetai.entity.Photo;

public interface PhotoService extends BaseService<PhotoDaoImpl,Photo>{
	public String uploadpic(File file,String userid,int time,Date date) throws IOException;
	public Photo getPhoto(String pid);
	public String getRandomPath(String userid);
}
