package com.project.exam.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Entity
public class User {
	
	@Id @GeneratedValue
	private Long id;
	
	private String name;
	
	private String email;

	@Builder
	public User(String name, String email) {
		this.name = name;
		this.email = email;
	}
	
	
}
