package DAO;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

import entities.Cart;
import entities.Category;
import entities.Product;
import entities.User;
import utils.JpaUtil;

public class ProductDAO {
	private EntityManager em;
	  public ProductDAO() {
		  this.em =JpaUtil.getEntityManager();
		  
	  }
	  public List<Product> getAll(){
		  String jpql ="SELECT obj FROM Product obj";
		  TypedQuery<Product> query =em.createQuery(jpql,Product.class);
		  return query.getResultList();
		  
	  }
	  public List<Product> getTheoDanhMuc(int id){
		  String jpql ="SELECT obj FROM Product obj WHERE obj.category.id = "+id;
		  TypedQuery<Product> query =em.createQuery(jpql,Product.class);
		  return query.getResultList();
		  
	  }
	  
	  public Product create(Product entity) throws Exception{
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
	  public Product update(Product entity) throws Exception{
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
		public Product findById(int id) {
			return this.em.find(Product.class, id);
		}

		
		public void delete(Product entity) throws Exception{
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
		

		
}
			
