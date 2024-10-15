package com.project.project1007.controller;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.project.project1007.model.MemberVO;

@RestController
public class HomeController {
	
	@PostMapping(value = "/aaa")
	public String LoginInfo(@RequestBody MemberVO memberVo) {
		
		System.out.println(memberVo.getId() + " / " + memberVo.getPassword() );
		
		return memberVo.getId();
	}
	
}
