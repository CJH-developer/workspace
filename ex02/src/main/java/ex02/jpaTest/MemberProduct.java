package ex02.jpaTest;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

@Entity
public class MemberProduct {

	@Id @GeneratedValue
	private Long id;
	
	@ManyToOne
	@JoinColumn(name="MEMBER_ID")
	private Member member;
	
	@ManyToOne
	@JoinColumn(name="PRODUCT_ID")
	private Product product;

	
	
}
	
	