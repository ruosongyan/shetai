package com.shetai.dao;

import java.io.File;
import java.io.IOException;

import com.shetai.entity.Photo;

public interface PhotoDao {
	public String uploadpic(File file,String userid) throws IOException;
	public Photo getPhoto(String pid);
}
