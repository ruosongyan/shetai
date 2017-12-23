package com.shetai.service.impl;

import org.springframework.stereotype.Service;

import com.shetai.dao.impl.SymptomTypeDaoImpl;
import com.shetai.entity.SymptomType;
import com.shetai.service.SymptomTypeService;

@Service
public class SymptomTypeServiceImpl extends BaseServiceImpl<SymptomTypeDaoImpl,SymptomType> implements SymptomTypeService{

}
