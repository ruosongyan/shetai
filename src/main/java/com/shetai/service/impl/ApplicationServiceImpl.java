package com.shetai.service.impl;

import org.springframework.stereotype.Service;

import com.shetai.dao.impl.ApplicationDaoImpl;
import com.shetai.entity.Application;
import com.shetai.service.ApplicationService;

@Service
public class ApplicationServiceImpl extends BaseServiceImpl<ApplicationDaoImpl,Application> implements ApplicationService{

}
