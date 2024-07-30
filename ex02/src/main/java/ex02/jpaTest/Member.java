package ex02.jpaTest;


import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;

import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

@Entity
public class Member extends BaseEntitiy{

	@Id @GeneratedValue
	@Column(name="MEMBER_ID")
	private Long id;
	
	@Column(name = "USERNAME")
	private String username;
	
	/* private List<Member> members = new ArrayList<>(); */
	
	@ManyToOne
	@JoinColumn(name="TEAM_ID")
	private Team team;
	
	@OneToOne
	@JoinColumn(name = "LOCKER_ID")
	private Locker locker;
	
	@OneToMany(mappedBy = "member")
	private List<MemberProduct> memberProducts = new ArrayList<>();
	
		

	
	
	public List<MemberProduct> getMemberProducts() {
		return memberProducts;
	}

	public void setMemberProducts(List<MemberProduct> memberProducts) {
		this.memberProducts = memberProducts;
	}

	public Team getTeam() {
		return team;
	}

	public void setTeam(Team team) {
		this.team = team;
	}

	public Locker getLocker() {
		return locker;
	}

	public void setLocker(Locker locker) {
		this.locker = locker;
	}

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
