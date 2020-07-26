package com.org.yantrik.githubdemo.repository;

import java.time.LocalDateTime;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.org.yantrik.githubdemo.model.UserSearchHistory;

@Repository
public interface UserRepository extends JpaRepository<UserSearchHistory, Long>{

	@Query(value = "from UserSearchHistory t where date BETWEEN :startDate AND :endDate")
	public List<UserSearchHistory> getAllBetweenDates(@Param("startDate")LocalDateTime startDate,@Param("endDate")LocalDateTime endDate);
}
