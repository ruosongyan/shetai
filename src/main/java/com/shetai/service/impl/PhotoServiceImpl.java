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
		Photo p = new Photo();
		p.setPid(Utils.uuid());
		p.setDid("0");
		p.setPosition(path);
		p.setPhoto_type(0);
		p.setTid(null);
		p.setUpload_date(date);
		p.setUid(userid);
		p.setTime(time);
		pdi.add(p);
		return "success" ;
	}
	
}
