package com.shetai.service;

import java.io.File;
import java.io.IOException;

import com.shetai.dao.impl.PhotoDaoImpl;
import com.shetai.entity.Photo;

public interface PhotoService extends BaseService<PhotoDaoImpl,Photo>{
	public String uploadpic(File file) throws IOException;

}
