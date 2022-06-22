package DAO;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;
import entities.Cart;
import entities.Product;
import utils.JpaUtil;

public class CartDAO {
	EntityManager em;
	public CartDAO() {
		em =JpaUtil.getEntityManager();
	}
	public List<Cart> getAll(){
		  String jpql ="SELECT obj FROM Cart obj";
		  TypedQuery<Cart> query =em.createQuery(jpql,Cart.class);
		  return query.getResultList();
		  
	  }
	public Cart create(Cart entity) throws Exception{
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
  public Cart update(Cart entity) throws Exception{
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
	public Cart findById(int id) {
		return this.em.find(Cart.class, id);
	}

	
	public void delete(Cart entity) throws Exception{
		try {
			this.em.getTransaction().begin();
			//
			this.em.remove(entity);
			this.em.getTransaction().commit();
			
			
		} catch (Exception e) {
			e.printStackTrace();
			this.em.getTransaction().rollback();
			throw e;
		}
	}
	public List<Cart> findByStatus(int status){
		  String jpql ="SELECT obj FROM Cart obj WHERE obj.status = :status";
		  
		  TypedQuery<Cart> query =em.createQuery(jpql,Cart.class);
		  query.setParameter("status",status);
		  
		  return query.getResultList();
		  
	  }
	
}
