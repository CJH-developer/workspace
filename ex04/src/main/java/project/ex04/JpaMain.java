package project.ex04;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import javax.persistence.Query;
import javax.persistence.TypedQuery;

public class JpaMain {

	public static void main(String[] args) {
		
		EntityManagerFactory emf = Persistence.createEntityManagerFactory("hello");
		
		EntityManager em = emf.createEntityManager();
		EntityTransaction tx = em.getTransaction();
		tx.begin();
		
		try {
			
			Member member = new Member();
			member.setUsername("member1");
			member.setAge(10);
			em.persist(member);
			
			em.flush();
			em.clear();
			
			em.createQuery("select new jpql.MemberDTO( m.username, m.age ) from Member m", MemberDTO.class).getResultList();
			
			/*
			   - Type 방법
			   List<Object[]> result = em.createQuery("select m.username, m.age from Member m").getResultList();
			   Object[] results = result.get(0);
			 */
			
			/*
			   - Object 방법
			   List result = em.createQuery("select m from Member m", Member.class).getResultList();
			 	Object o = result.get(0); 
			 	Object[] results = (Object[]) o;
			 */
			
			
			tx.commit();
		} catch (Exception e) {
			tx.rollback();
		}finally {
			em.close();
		}
		emf.close();

	}

}
