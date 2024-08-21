package com.project.project0821.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.project.project0821.entity.Member;

public interface MemberRepository extends JpaRepository<Member, Long>{

}
