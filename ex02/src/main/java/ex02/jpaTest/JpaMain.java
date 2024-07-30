package ex02.jpaTest;

import java.time.LocalDateTime;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import javax.persistence.PersistenceUnit;
import javax.persistence.PersistenceUnits;

public class JpaMain {

	public static void main(String[] args) {

		EntityManagerFactory emf = Persistence.createEntityManagerFactory("hello");

		EntityManager em = emf.createEntityManager();

		EntityTransaction tx = em.getTransaction();
		tx.begin();

		try {
			
			Member member = new Member();
			member.setUsername("hello");
			
			em.persist(member);
			
			em.flush();
			em.clear();
			
			Member refMember = em.getReference(Member.class, member.getId());
			System.out.println("refMember : " + refMember.getClass());
			refMember.getUsername();
			System.out.println("isLoaded : " + emf.getPersistenceUnitUtil().isLoaded(refMember));
			
			Member findMember = em.find(Member.class, member.getId());
			System.out.println("FindMember : " + findMember.getClass());
			
			
			
			/*
			 * em.close(); refMember.getUsername();
			 */
			
			
			/*
			 * Member member = new Member(); member.setCreatedBy("kim");
			 * member.setCreatedDate(LocalDateTime.now());
			 * 
			 * em.persist(member);
			 */
			
			/*
			 * Movie movie = new Movie(); movie.setDirector("movie감독1");
			 * movie.setActor("Movie배우1"); movie.setName("movie영화1"); movie.setPrice(15000);
			 * em.persist(movie);
			 * 
			 * em.flush(); em.clear();
			 * 
			 * Movie findMoveId = em.find(Movie.class, movie.getId());
			 * System.out.println(findMoveId.getId());
			 */
			/*
			 * Member member = new Member(); member.setUsername("member1");
			 * 
			 * em.persist(member);
			 * 
			 * Team team = new Team(); team.setName("teamA"); team.getMembers().add(member);
			 * 
			 * em.persist(team);
			 */

			tx.commit();
			/* member.setTeam(team); 이렇게 지정하면 JPA가 알아서 PK값을 FK값으로 지정 */
			// 외래키 식별자를 직접 다룬다.
			/* member.setTeamId(team.getId()); */
			/*
			 * Member findMember = em.find(Member.class, member.getId()); List<Member>
			 * members = findMember.getTeam().getMembers();
			 * 
			 * for(Member m : members) { System.out.println("m = " + m.getUsername()); }
			 */
			/*
			 * Long findTeamId = findMember.getTeamId(); Team findTeam = em.find(Team.class,
			 * findTeamId); Long findTeam_id = findTeam.getId();
			 */
			
			
			/*
			 * // 가짜 주인 Team team = new Team(); team.setName("TeamA"); em.persist(team);
			 * 
			 * // 진짜 주인 Member member = new Member(); member.setUsername("member1");
			 * member.changeTeam(team); em.persist(member);
			 * 
			 * 
			 * 
			 * 
			 * em.flush(); em.clear();
			 * 
			 * 
			 * Team findTeam = em.find(Team.class, team.getId()); List<Member> members =
			 * findTeam.getMembers();
			 * 
			 * for(Member m : members) { System.out.println("m : " + m.getUsername()); }
			 */
		} catch (Exception e) {
			e.printStackTrace();
			tx.rollback();
		} finally {
			em.close();
		}
		emf.close();
	}
}
