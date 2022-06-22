package DAO;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

import entities.User;
import utils.JpaUtil;

public class UserDAO {
	private EntityManager em;
	  public UserDAO() {
		  this.em =JpaUtil.getEntityManager();
		  
	  }
	  public List<User> getAll(){
		  String jpql ="SELECT OBJ FROM User OBJ";
		  TypedQuery<User> query =em.createQuery(jpql,User.class);
		  return query.getResultList();
		  
	  }
	  public User create(User entity) throws Exception{
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
		public User update(User entity) throws Exception{
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
		public User findById(int id) {
			return this.em.find(User.class, id);
		}

		public User findByEmail(String email) {
			String jpql = "SELECT obj FROM User obj"
				+ " WHERE obj.email = :email";
			TypedQuery<User> query = this.em
				.createQuery(jpql, User.class);
			
			query.setParameter("email", email);
			
			return query.getSingleResult();
		}
		public void delete(User entity) throws Exception{
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
