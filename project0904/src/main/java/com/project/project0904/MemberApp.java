package com.project.project0904;

import com.project.project0904.member.Grade;
import com.project.project0904.member.Member;
import com.project.project0904.member.MemberService;
import com.project.project0904.member.MemberServiceImpl;

public class MemberApp {

	private static void main(String[] args) {
		
		MemberService memberService = new MemberServiceImpl();
		Member member1 = new Member(1L, "memberA", Grade.VIP);
		
		memberService.join(member1);
		
		Member findMember = memberService.findMember(1L);
		
		System.out.println("new Member : " + member1.getName() );
		System.out.println("findMember : " + findMember);
	}
}
