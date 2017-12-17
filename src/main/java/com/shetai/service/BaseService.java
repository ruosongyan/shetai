package com.shetai.service;

import java.util.List;

import com.shetai.dao.impl.BaseDaoImpl;

public interface BaseService<E extends BaseDaoImpl<T>,T>{
	public boolean add(T entity);
	
	public boolean delete(T entity);
	
	public boolean update(T entity);
	
	public List<T> query(String table);
	
	public List<T> query(String table,T entity);
	
	public T query(String table,String id);
}
