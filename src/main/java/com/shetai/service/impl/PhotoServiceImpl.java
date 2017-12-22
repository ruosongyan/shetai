package com.shetai.service.impl;

import java.io.File;
import java.io.IOException;
import java.sql.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shetai.dao.impl.PhotoDaoImpl;
import com.shetai.entity.Photo;
import com.shetai.service.PhotoService;
import com.shetai.utils.Utils;

@Service
public class PhotoServiceImpl extends BaseServiceImpl<PhotoDaoImpl,Photo> implements PhotoService{
	@Autowired
	private PhotoDaoImpl pdi;
	
	@Override
	public String uploadpic(File file,String userid,int time,Date date) throws IOException {
		// TODO Auto-generated method stub
		String path = pdi.uploadpic(file,userid);
		return path ;
	}

	@Override
	public Photo getPhoto(String pid) {
		// TODO Auto-generated method stub
		
		return pdi.getPhoto(pid);
	}

	@Override
	public String getRandomPath(String userid) {
		// TODO Auto-generated method stub
		String newPath = userid+"/"+pdi.getRandomString(20);
		
		return newPath;
	}
	
}
