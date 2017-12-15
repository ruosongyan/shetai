package com.shetai.dao;

import java.util.List;

public interface BaseDao<E> {
	public boolean add(E entity);
	
	public boolean delete(E entity);
	
	public boolean update(E entity);
	
	public List<E> query(String table);
}
