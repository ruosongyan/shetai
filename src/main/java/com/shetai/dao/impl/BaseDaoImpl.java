package com.shetai.dao.impl;

import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.shetai.dao.BaseDao;
import com.shetai.entity.User;

@Repository
public class BaseDaoImpl<E> implements BaseDao<E>{
	@Autowired
	protected SessionFactory sessionFactory;
	
	public boolean add(E entity) {
        Session session=sessionFactory.openSession();  
        try {
        	Transaction t=session.beginTransaction();  
            session.save(entity);
            t.commit();
        }catch (Exception e) {
        	e.printStackTrace();  
            session.getTransaction().rollback();  
            return false;
		}finally {
			session.close();
		}
		return true;
	}
	
	public boolean delete(E entity) {
		Session session=sessionFactory.openSession();    
        try {
        	Transaction t=session.beginTransaction();  
            session.delete(entity);
            t.commit();
        }catch (Exception e) {
        	e.printStackTrace();  
            session.getTransaction().rollback();  
            return false;
		}finally {
			session.close();
		}
		return true;
	}
	
	public boolean update(E entity) {
		Session session=sessionFactory.openSession();    
        try {
        	Transaction t=session.beginTransaction();  
            session.update(entity);
            t.commit();
        }catch (Exception e) {
        	e.printStackTrace();  
            session.getTransaction().rollback();  
            return false;
		}finally {
			session.close();
		}
		return true;
	}
	
	public List<E> query(String table){
		Session session=null;
		try {
			session=sessionFactory.openSession();   
	    	String hql="from "+table;
			Query query = session.createQuery(hql);
			return query.list();
		} finally {
			// TODO: handle finally clause
			session.close();
		}
	}
	
	public List<E> query(String table,E entity){
		Session session=null;
		try {
			session=sessionFactory.openSession();   
	    	String hql="from "+table+" where ";
	    	Class ecla=entity.getClass();
			Field[] fs=ecla.getDeclaredFields();
			for(int i=0;i<fs.length-1;i++) {
	        	Field f = fs[i];  
		        f.setAccessible(true);
				Object val = f.get(entity);
				String value=f.getName();
				String type = f.getType().toString();
				if(val!=null) {
					if(type.endsWith("String")) {
						hql+=(value+"='"+val.toString()+"' and ");
					}else {
						hql+=(value+"="+val.toString()+" and ");
					}
				}
			}
			hql=hql.replaceAll(" and $", "");
			Query query = session.createQuery(hql);
			return query.list(); 
		} catch (IllegalArgumentException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			session.close();
		}
		return null;
	}
	
	public E query(String table,String id){
		E result=null;
		Session session=sessionFactory.openSession();   
		result=(E) session.get(result.getClass(), id);
		return result;
	}

}
