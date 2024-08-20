package com.project.testProject.controller;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;


import com.project.testProject.common.TestVO;

@RestController
@RequestMapping("/api")
public class TestController {

	@PostMapping("/data")
	public String data(@RequestBody TestVO testVO) {
		System.out.println("데이터받음"); 
		System.out.println("받은 데이터 : " + testVO.getInputData());
		return "성공";
	}
	


	
	
}


