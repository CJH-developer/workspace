package ex01;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;

import ex01.domain.Book;
import ex01.domain.Member;
import ex01.domain.Order;
import ex01.domain.OrderItem;

public class JpaMain {

	public static void main(String[] args) {
		
		EntityManagerFactory emf = Persistence.createEntityManagerFactory("hellos");
		
		EntityManager em = emf.createEntityManager();
		
		EntityTransaction tx = em.getTransaction();
		tx.begin();
		
		try {
			
			Member member = em.find(Member.class, 1L);
			printMember(member);
			em.persist(member);
			tx.commit();
		} catch (Exception e) {

			tx.rollback();
		}finally {
			em.close();
		}
		emf.close();
	}

	private static void printMember(Member member) {
		System.out.println(member.getName());
		
	}
	
}
