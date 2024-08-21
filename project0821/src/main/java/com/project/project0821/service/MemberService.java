package com.project.project0821.service;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.project.project0821.dto.MemberDTO;
import com.project.project0821.entity.Member;
import com.project.project0821.repository.MemberRepository;

@Service
public class MemberService {

	private MemberRepository memberRepository;
	
	public MemberService(MemberRepository memberRepository) {
		this.memberRepository = memberRepository;
	}
	
	@Transactional
	public Member saveMember(MemberDTO memberDTO ) {
		return memberRepository.save(memberDTO.toEntity());
	}
}
