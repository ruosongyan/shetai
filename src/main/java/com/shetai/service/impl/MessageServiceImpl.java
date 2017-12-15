package com.shetai.service.impl;

import org.springframework.stereotype.Service;

import com.shetai.dao.impl.MessageDaoImpl;
import com.shetai.entity.Message;
import com.shetai.service.MessageService;

@Service
public class MessageServiceImpl extends BaseServiceImpl<MessageDaoImpl,Message> implements MessageService{

}
