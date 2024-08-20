package com.project.exam.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.project.exam.entity.User;

@Repository("UserRepository")
public interface UserRepository extends JpaRepository<User, Long>{

}
