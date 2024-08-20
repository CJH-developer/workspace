package com.project.exam.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.project.exam.dto.DataVO;

@RestController
public class HomeController {

	@GetMapping("/main")
	public String main(@RequestBody DataVO dataVO) {
		System.out.println("데이터 받음 : " + dataVO.getName());
		return dataVO.getName();
	}
}
