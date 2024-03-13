package com.tobeto.dto.employee;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class EditRoleResponseDTO {
	private String previousRole;
	private String currentRole;
	private String email;
	private String name;
	private String surname;

}
