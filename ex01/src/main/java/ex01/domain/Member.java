package ex01.domain;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Embedded;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

@Entity
public class Member extends BaseEntitiy{
	
	@Id @GeneratedValue
	@Column(name="MEMBER_ID", insertable = false , updatable = false)
	private Long id;
	
	private String name;
	
	@Embedded
	private Address address;
	
	
	private DeliveryStatus status;

	
	@ManyToOne
	@JoinColumn(name = "MEMBER_ID", insertable = false, updatable = false)
	private Member member;
	
	@OneToMany(mappedBy = "member" )
	private List<Order> order = new ArrayList<>();
	
	
	
	
	
	public Member getMember() {
		return member;
	}
	public void setMember(Member member) {
		this.member = member;
	}
	public List<Order> getOrder() {
		return order;
	}
	public void setOrder(List<Order> order) {
		this.order = order;
	}
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Address getAddress() {
		return address;
	}
	public void setAddress(Address address) {
		this.address = address;
	}
	
	
}
