package com.project.exam.controller;


import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.project.exam.entity.User;
import com.project.exam.repository.UserRepository;
import com.project.exam.service.UserServiceImpl;

import lombok.RequiredArgsConstructor;

@RestController
@RequiredArgsConstructor
public class UserController {
	
	@Qualifier(value = "UserService")
	private UserServiceImpl userService;
	
	@Qualifier(value = "UserRepository")
	private UserRepository userRepository;
	
	@PostMapping("/users")
	public String saveUser(@RequestBody User user) {
		System.out.println(user.getName());
		userService.saveUser(user);
		return "성공";
	}
}
