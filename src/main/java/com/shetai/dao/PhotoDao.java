package com.shetai.dao;

import java.io.File;
import java.io.IOException;

public interface PhotoDao {
	public String uploadpic(File file,String userid) throws IOException;

}
