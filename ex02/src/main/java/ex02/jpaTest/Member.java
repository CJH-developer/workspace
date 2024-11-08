package ex02.jpaTest;


import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;


import javax.persistence.CascadeType;

import javax.persistence.Column;

import javax.persistence.Embedded;
import javax.persistence.Entity;

import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;


import javax.persistence.OneToMany;

@Entity
public class Member{

	@Id @GeneratedValue
	@Column(name="MEMBER_ID")
	private Long id;
	
	@Column(name = "USERNAME")
	private String username;
	
	@Embedded
	private Period workPeriod;
	
	@Embedded
	private Address homeAddress;
	
//	@ElementCollection
//	@CollectionTable(name="FAVORITE_FOOD", joinColumns = @JoinColumn(name="MEMBER_ID") )
//	@Column(name="FOOD_NAME")
//	private Set<String> favoriteFoods = new HashSet<>();
	
//	@ElementCollection
//	@CollectionTable(name="ADDRESS", joinColumns = @JoinColumn(name="MEMBER_ID") )
//  private List<Address> addressHistory = new ArrayList<>();
	@OneToMany(cascade = CascadeType.ALL, orphanRemoval = true)
	@JoinColumn(name="MEMBER_ID")
	private List<AddressEntity> addressHistory = new ArrayList<>();

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public Period getWorkPeriod() {
		return workPeriod;
	}

	public void setWorkPeriod(Period workPeriod) {
		this.workPeriod = workPeriod;
	}

	public Address getHomeAddress() {
		return homeAddress;
	}

	public void setHomeAddress(Address homeAddress) {
		this.homeAddress = homeAddress;
	}


	public List<AddressEntity> getAddressHistory() {
		return addressHistory;
	}

	public void setAddressHistory(List<AddressEntity> addressHistory) {
		this.addressHistory = addressHistory;
	}



	

	
	
	
	
	
	
	
	
	
	
	
//	@Embedded
//	@AttributeOverrides({ @AttributeOverride(name = "city", column = @Column(name = "HOME_CITY")),
//								      @AttributeOverride(name="street", column = @Column(name = "HOME_STREET")),
//								      @AttributeOverride(name="zipcode", column = @Column(name = "HOME_ZIPCODE"))
//	})
//	private Address homeAddress;
	
	
	
	
	
// 프록시 객체 조회 ( Member 클래스만 조회 )
//	@ManyToOne(fetch = FetchType.EAGER)
//	@JoinColumn(name="TEAM_ID")
//	private Team team;

	/*
	 * @OneToOne
	 * 
	 * @JoinColumn(name = "LOCKER_ID") private Locker locker;
	 * 
	 * @OneToMany(mappedBy = "member") private List<MemberProduct> memberProducts =
	 * new ArrayList<>();
	 */
	
		

	
	
	/*
	 * public List<MemberProduct> getMemberProducts() { return memberProducts; }
	 * 
	 * public void setMemberProducts(List<MemberProduct> memberProducts) {
	 * this.memberProducts = memberProducts; }
	 */

//	public Team getTeam() {
//		return team;
//	}
//
//	public void setTeam(Team team) {
//		this.team = team;
//	}

	/*
	 * public Locker getLocker() { return locker; }
	 * 
	 * public void setLocker(Locker locker) { this.locker = locker; }
	 */

//	public Long getId() {
//		return id;
//	}
//
//	public void setId(Long id) {
//		this.id = id;
//	}
//
//	public String getUsername() {
//		return username;
//	}
//
//	public void setUsername(String username) {
//		this.username = username;
//	}

	/**/
	/*
	 * @Column(name = "TEAM_ID") private Long teamId;
	 */
	
	
	/*
	 * // 연관 관계의 주인
	 * 
	 * @ManyToOne
	 * 
	 * @JoinColumn(name="TEAM_ID") private Team team;
	 * 
	 * public Member() {
	 * 
	 * }
	 * 
	 * 
	 * public Team getTeam() { return team; }
	 * 
	 * public void changeTeam(Team team) { this.team = team;
	 * team.getMembers().add(this); }
	 
	 */
	
}
