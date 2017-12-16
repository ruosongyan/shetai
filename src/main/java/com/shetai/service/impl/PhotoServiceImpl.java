package com.shetai.service.impl;

import java.io.File;
import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shetai.dao.impl.PhotoDaoImpl;
import com.shetai.entity.Photo;
import com.shetai.service.PhotoService;

@Service
public class PhotoServiceImpl extends BaseServiceImpl<PhotoDaoImpl,Photo> implements PhotoService{
	@Autowired
	private PhotoDaoImpl pdi;
	
	@Override
	public String uploadpic(File file) throws IOException {
		// TODO Auto-generated method stub
		String result = pdi.uploadpic(file);
		return result ;
	}
}
