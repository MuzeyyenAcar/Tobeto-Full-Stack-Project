package com.tobeto.controller;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.tobeto.dto.employee.AddResponseDTO;
import com.tobeto.dto.employee.DeleteRequestDTO;
import com.tobeto.dto.employee.DeleteResponseDTO;
import com.tobeto.dto.employee.EditPasswordRequestDTO;
import com.tobeto.dto.employee.EditPasswordResponseDTO;
import com.tobeto.dto.employee.EditRoleRequestDTO;
import com.tobeto.dto.employee.EditRoleResponseDTO;
import com.tobeto.dto.employee.EmployeeDTO;
import com.tobeto.dto.employee.GetRequestDTO;
import com.tobeto.dto.employee.GetResponseDTO;
import com.tobeto.entity.Employee;
import com.tobeto.service.EmployeeService;

@RestController
@RequestMapping("/api/v1/employee")
public class EmployeeController {
	@Autowired
	private EmployeeService employeeService;
	@Autowired
	@Qualifier("requestMapper")
	private ModelMapper requestMapper;
	@Autowired
	@Qualifier("responseMapper")
	private ModelMapper responseMapper;

	@PostMapping("/add")
	public AddResponseDTO AddResponseEmployeeDTO(@RequestBody EmployeeDTO dto) {
		Employee employee = requestMapper.map(dto, Employee.class);
		employeeService.createEmployee(employee);
		return new AddResponseDTO(employee.getId());
	}

	@GetMapping("/get")
	public GetResponseDTO getEmployee(@RequestBody GetRequestDTO dto) {
		Employee employee = employeeService.readEmployee(dto.getEmail());
		return new GetResponseDTO(employee.getId(), employee.getName(), employee.getPassword(), employee.getEmail(),
				employee.getRol());
	}

	@DeleteMapping("/del")
	public DeleteResponseDTO deleteEmployee(@RequestBody DeleteRequestDTO dto) {
		employeeService.deleteEmployee(dto.getEmail());
		return new DeleteResponseDTO("Employee deleted.");
	}

	@PutMapping("/edit/role")
	public EditRoleResponseDTO editRole(@RequestBody EditRoleRequestDTO dto) {
		Employee employee = employeeService.readEmployee(dto.getEmail());
		String previusRole = employee.getRol();
		employee.setRol(dto.getRole());
		employeeService.createEmployee(employee);
		System.out.println("Role.. Calisiyor");
		return new EditRoleResponseDTO(previusRole, dto.getRole(), dto.getEmail(), employee.getName(),
				employee.getSurname());
	}

	@PutMapping("/edit/password")
	public EditPasswordResponseDTO editPassword(@RequestBody EditPasswordRequestDTO dto) {
		Employee employee = employeeService.updatePassword(dto.getEmail(), dto.getPreviousPassword(),
				dto.getNewPassword());
		String message;
		if (dto.getNewPassword().equals(employee.getPassword())) {
			message = "Password succesfully changed!";
		} else {
			message = "Error!";
		}
		System.out.println("Password.. Calisiyor");
		return new EditPasswordResponseDTO(dto.getPreviousPassword(), dto.getNewPassword(), dto.getEmail(), message);
	}
}