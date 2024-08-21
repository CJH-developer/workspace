package com.project.project0821.dto;


import com.project.project0821.entity.Member;

import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
public class MemberDTO {

	private int mno;
	private String id;
	private String name;
	
	public Member toEntity() {
		
		Member build = Member.builder()
				.mno(this.mno)
				.id(this.id)
				.name(this.name)
				.build();
		return build;
	}
	
	@Builder
	public MemberDTO(int mno, String id, String name) {
		this.mno = mno;
		this.id = id;
		this.name = name;
	}
	
	
}
