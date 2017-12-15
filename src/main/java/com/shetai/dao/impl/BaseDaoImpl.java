package com.shetai.dao.impl;

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
	private SessionFactory sessionFactory;
	
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
		Session session=sessionFactory.openSession();   
    	String hql="from "+table;
		Query query = session.createQuery(hql);
		session.close();
		return query.list(); 
	}
	
	public E query(String table,String id){
		E result=null;
		Session session=sessionFactory.openSession();   
		result=(E) session.get(result.getClass(), id);
		return result;
	}

}
