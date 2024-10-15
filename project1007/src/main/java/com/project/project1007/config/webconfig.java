package com.project.project1007.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.CorsRegistry;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
@EnableWebMvc
public class webconfig implements WebMvcConfigurer{

	@Override
	public void addCorsMappings(CorsRegistry registry) {
	    registry.addMapping("/**")
	        .allowedOrigins("http://192.168.11.170:8081", "http://localhost:8081")
	        .allowCredentials(true)
	        .allowedMethods("GET", "POST", "PUT", "DELETE");
	}

	
}
