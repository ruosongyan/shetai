package com.shetai.service.impl;

import org.springframework.stereotype.Service;

import com.shetai.dao.impl.PhotoDaoImpl;
import com.shetai.entity.Photo;
import com.shetai.service.PhotoService;

@Service
public class PhotoServiceImpl extends BaseServiceImpl<PhotoDaoImpl,Photo> implements PhotoService{

}
