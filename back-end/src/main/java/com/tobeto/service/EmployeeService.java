package com.tobeto.service;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tobeto.entity.Employee;
import com.tobeto.repository.EmployeeRepository;

import jakarta.transaction.Transactional;
import lombok.Data;

@Service
@Data
public class EmployeeService {
	@Autowired
	EmployeeRepository employeeRepository;

	public void createEmployee(Employee employee) {
		employeeRepository.save(employee);
	}

	public Employee readEmployee(String email) {
		Optional<Employee> employee = employeeRepository.findByEmail(email);
		return employee.orElseThrow();
	}

	public Employee updatePassword(String email, String oldPassword, String newPassword) {
		Employee employee = readEmployee(email);
		if (employee.getPassword().equals(oldPassword)) {
			employee.setPassword(newPassword);
			createEmployee(employee);
		}
		return employee;
	}

	@Transactional
	public void deleteEmployee(String email) {
		employeeRepository.deleteByEmail(email);
	}

}
