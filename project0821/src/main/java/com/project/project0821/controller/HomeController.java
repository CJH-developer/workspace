package com.project.project0821.controller;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.project.project0821.dto.MemberDTO;
import com.project.project0821.service.MemberService;

@RestController 
public class HomeController {

	private MemberService memberService;
	
	
	
	public HomeController(MemberService memberService) {
		this.memberService = memberService;
	}



	@PostMapping(value = "/main")
	public String main(@RequestBody MemberDTO memberDTO) {
		System.out.println("불러온 데이터 : " + memberDTO.getId() + " | " + memberDTO.getName() );
		memberService.saveMember(memberDTO);
		return "성공";
	}
}
