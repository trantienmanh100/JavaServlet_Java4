package DAO;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

import entities.Category;

import utils.JpaUtil;



public class CategoryDAO {
	private EntityManager em = JpaUtil.getEntityManager();
	
	public List<Category> getAll(){
		String jpql = "SELECT obj FROM Category obj";
		TypedQuery<Category> query = this.em.createQuery(jpql,Category.class);
		return query.getResultList();
		
	}

	public Category findById(int id) {
		return this.em.find(Category.class, id);
	}
	
	public Category create(Category entity) {
		try {
			this.em.getTransaction().begin();
			this.em.persist(entity);
			this.em.flush();
			this.em.getTransaction().commit();
		} catch (Exception e) {
			e.printStackTrace();
			this.em.getTransaction().rollback();
			throw e;
		}
		return entity;
	}
	
	public void delete(Category entity) throws Exception {
		try {
			this.em.getTransaction().begin();
			this.em.remove(entity);
			this.em.getTransaction().commit();
		} catch (Exception e) {
			e.printStackTrace();
			this.em.getTransaction().rollback();
			throw e;
		}
	}

	public void update(Category entity) throws Exception {
		try {
			this.em.getTransaction().begin();
			this.em.merge(entity);
			this.em.getTransaction().commit();
		} catch (Exception e) {
			e.printStackTrace();
			this.em.getTransaction().rollback();
			throw e;
		}
	}
	public Category findMyId(int id) {
		return this.em.find(Category.class, id);
		
	}

}
