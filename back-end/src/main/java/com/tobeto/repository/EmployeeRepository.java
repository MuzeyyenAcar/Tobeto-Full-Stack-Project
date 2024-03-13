package com.tobeto.repository;

import java.util.Optional;
import java.util.UUID;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.tobeto.entity.Employee;

@Repository
public interface EmployeeRepository extends JpaRepository<Employee, UUID> {
	void deleteByEmail(String email);

	Optional<Employee> findByEmail(String email);
}