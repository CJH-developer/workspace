package com.project.project0904.member;

public class MemberServiceImpl implements MemberService{
	
	private final MemberRepository memberRepository = new MemoryMemberRepository();

	@Override
	public void join(Member member) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public Member findMember(Long memberId) {
		// TODO Auto-generated method stub
		return null;
	}

}
