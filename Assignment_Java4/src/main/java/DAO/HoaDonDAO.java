package DAO;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

import entities.Hoadon;
import utils.JpaUtil;

public class HoaDonDAO {
	EntityManager em;
	public HoaDonDAO() {
		em=JpaUtil.getEntityManager();
	}
	public Hoadon create(Hoadon entity) throws Exception{
		try {
			this.em.getTransaction().begin();
			//
			this.em.persist(entity);
			this.em.flush();
			this.em.getTransaction().commit();
			this.em.clear();
			return entity;
		} catch (Exception e) {
			e.printStackTrace();
			this.em.getTransaction().rollback();
			throw e;
		}
	}
	public Hoadon update(Hoadon entity) throws Exception{
		try {
			this.em.getTransaction().begin();
			//
			this.em.merge(entity);
			this.em.getTransaction().commit();
			this.em.clear();
			return entity;
		} catch (Exception e) {
			e.printStackTrace();
			this.em.getTransaction().rollback();
			throw e;
		}
	}
	public Hoadon findById(int id) {
		return this.em.find(Hoadon.class, id);
	}
	public List<Hoadon> findHoaDonByUser(int id){
		String jpql = "Select h from Hoadon h  where h.user.id = :id";
		TypedQuery<Hoadon> query = this.em.createQuery(jpql,Hoadon.class);
		query.setParameter("id", id);
		return query.getResultList();
	}
	public List<Hoadon> findHoaDonbystatus(int status){
		String jpql = "Select h from Hoadon h  where h.status= :status";
		TypedQuery<Hoadon> query = this.em.createQuery(jpql,Hoadon.class);
		query.setParameter("status", status);
		return query.getResultList();
	}
	public List<Hoadon> getTrangThaiNH3(){
		  String jpql ="SELECT obj FROM Hoadon obj where obj.status<3";
		  TypedQuery<Hoadon> query =em.createQuery(jpql,Hoadon.class);
		  return query.getResultList();
		  
	  }	
}
