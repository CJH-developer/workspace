package com.project.exam.service;


import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.project.exam.entity.User;
import com.project.exam.repository.UserRepository;

import lombok.RequiredArgsConstructor;

@Service(value = "UserService")
@RequiredArgsConstructor
public class UserServiceImpl implements UserService{

	@Qualifier(value = "UserRepository")
	private UserRepository userRepository;
	
	@Override
	public void saveUser(User user) {
		System.out.println(user.getName());
		userRepository.save(user);		
	}



}
