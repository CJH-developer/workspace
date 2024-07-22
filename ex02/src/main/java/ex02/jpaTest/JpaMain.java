package ex02.jpaTest;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;

public class JpaMain {

	public static void main(String[] args) {
		
		EntityManagerFactory emf = Persistence.createEntityManagerFactory("hello");
		
		EntityManager em = emf.createEntityManager();
		
		EntityTransaction tx = em.getTransaction();
		tx.begin();
		
		try {
			
			Team team = new Team();
			team.setName("TeamA");
			em.persist(team);

			Member member = new Member();
			member.setUsername("member1");
			member.setTeam(team); // 이렇게 지정하면 JPA가 알아서 PK값을 FK값으로 지정
			// 외래키 식별자를 직접 다룬다.
			/* member.setTeamId(team.getId()); */
			em.persist(member);
			
			em.flush();
			em.clear();
			
			Member findMember = em.find(Member.class, member.getId());
			List<Member> members = findMember.getTeam().getMembers();
			
			for(Member m : members) {
				System.out.println("m = " + m.getUsername());
			}
			/*
			 * Long findTeamId = findMember.getTeamId(); Team findTeam = em.find(Team.class,
			 * findTeamId); Long findTeam_id = findTeam.getId();
			 */
			tx.commit();
		} catch (Exception e) {
			e.printStackTrace();
			tx.rollback();
		}finally {
			em.close();
		}
		emf.close();
	}
}
