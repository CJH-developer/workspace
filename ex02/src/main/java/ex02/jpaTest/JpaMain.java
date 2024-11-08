package ex02.jpaTest;


import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;


public class JpaMain {

	public static void main(String[] args) {

		EntityManagerFactory emf = Persistence.createEntityManagerFactory("hello");

		EntityManager em = emf.createEntityManager();

		EntityTransaction tx = em.getTransaction();
		tx.begin();

		try {
			
				CriteriaBuilder cb = em.getCriteriaBuilder();
				
				CriteriaQuery<Member> query = cb.createQuery(Member.class);
				
				Root<Member> m = query.from(Member.class);
				
				CriteriaQuery<Member> cq = query.select(m).where(cb.equal(m.get("username"),  "kim"));
				List<Member> resultList =  em.createQuery(cq).getResultList();
	
			
				tx.commit();
			
//					Member member = new Member();
//					member.setUsername("test1");
//					member.setHomeAddress(new Address("home", "street", "10000"));
//					
//					member.getFavoriteFoods().add("치킨1");
//					member.getFavoriteFoods().add("치킨2");
//					member.getFavoriteFoods().add("치킨3");
//					
//					member.getAddressHistory().add(new AddressEntity("old1", "street1", "20000"));
//					member.getAddressHistory().add(new AddressEntity("old2", "street2", "20000"));
//					
//					em.persist(member);
//					em.flush();
//					em.clear();
//					
//					System.out.println("=======START========");
//					Member findMember = em.find(Member.class, member.getId());
					
//					findMember.setHomeAddress(new Address("newCity", "newStreet", "30000") );
//					
//					findMember.getFavoriteFoods().remove("치킨1");
//					findMember.getFavoriteFoods().add("한식");
//					
//					findMember.getAddressHistory().remove(new AddressEntity("old1", "street1", "20000") );
//					findMember.getAddressHistory().add(new AddressEntity("newCity1", "street1", "20000") );
					
					
//			Address address = new Address("city", "street", "10000");
//			
//			Member member1 = new Member();
//			member1.setUsername("member1");
//			member.setWorkAddress(new Address("city", "street", "10") );
//			member.setWorkPeriod(new Period());
//			member1.setWorkAddress(address);
//			em.persist(member1);
//			
//			// 인스턴스 복사
//			Address copyAddress = new Address( address.getCity(), address.getStreet(), address.getZipcode() );
//			
//			Member member2 = new Member();
//			member2.setUsername("member2");
//			// 복사한 인스턴스 값 추가
//			member2.setWorkAddress(copyAddress);
//			em.persist(member2);
//			
//			member1.getWorkAddress().setCity("newCity");
			/*
			 * Child child1 = new Child(); Child child2 = new Child();
			 * 
			 * Parent parent = new Parent(); parent.addChild(child1);
			 * parent.addChild(child2);
			 * 
			 * em.persist(parent); em.flush(); em.clear();
			 * 
			 * Parent findParent = em.find(Parent.class, parent.getId());
			 * findParent.getChildList().remove(0);
			 */
			
			/*
			 * Team team = new Team(); team.setName("LazyTeam"); em.persist(team);
			 * 
			 * Member member= new Member(); member.setUsername("LazyTest");
			 * member.setTeam(team); em.persist(member);
			 * 
			 * em.flush(); em.clear();
			 * 
			 * Member m = em.find(Member.class, member.getId()); System.out.println(" m = "
			 * + m.getTeam().getClass());
			 * 
			 * System.out.println("======================="); m.getTeam().getName();
			 * System.out.println("=======================");
			 */
			
			
			
			/*
			 * Member member = new Member(); member.setUsername("hello");
			 * 
			 * em.persist(member);
			 * 
			 * em.flush(); em.clear();
			 * 
			 * Member refMember = em.getReference(Member.class, member.getId());
			 * System.out.println("refMember : " + refMember.getClass());
			 * refMember.getUsername(); System.out.println("isLoaded : " +
			 * emf.getPersistenceUnitUtil().isLoaded(refMember));
			 * 
			 * Member findMember = em.find(Member.class, member.getId());
			 * System.out.println("FindMember : " + findMember.getClass());
			 */
			
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
			
//			List<Member> result = em.createQuery(
//			"select m From Member as m where m.username like '%kim%' ", Member.class
//		).getResultList();
		} catch (Exception e) {
			e.printStackTrace();
			tx.rollback();
		} finally {
			em.close();
		}
		emf.close();
	}
}
