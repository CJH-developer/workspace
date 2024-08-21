package com.project.project0821;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.data.jpa.repository.config.EnableJpaAuditing;

@EnableJpaAuditing
@SpringBootApplication
public class Project0821Application {

	public static void main(String[] args) {
		SpringApplication.run(Project0821Application.class, args);
	}

}
