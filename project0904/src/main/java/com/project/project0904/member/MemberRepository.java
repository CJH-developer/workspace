package com.project.project0904.member;

public interface MemberRepository {

	void save(Member member);
	
	Member findById(Long memberId);
}
