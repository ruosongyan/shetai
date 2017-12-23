package com.shetai.service.impl;

import org.springframework.stereotype.Service;

import com.shetai.dao.impl.NoticeDaoImpl;
import com.shetai.entity.Notice;
import com.shetai.service.NoticeService;

@Service
public class NoticeServiceImpl extends BaseServiceImpl<NoticeDaoImpl,Notice> implements NoticeService{

}
