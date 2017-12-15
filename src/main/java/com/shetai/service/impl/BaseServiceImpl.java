package com.shetai.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.shetai.dao.impl.BaseDaoImpl;
import com.shetai.service.BaseService;

public class BaseServiceImpl<E extends BaseDaoImpl<T>,T> implements BaseService<E,T>{
	@Autowired
	E dao;
	
	public boolean add(T entity) {
		return dao.add(entity);
	}
	
	public boolean delete(T entity) {
		return dao.delete(entity);
	}
	
	public boolean update(T entity) {
		return dao.update(entity);
	}
	
	public List<T> query(String table){
		return dao.query(table);
	}

}
