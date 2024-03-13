package com.tobeto.dto.employee;

import lombok.Data;

@Data
public class EditPasswordRequestDTO {
	private String previousPassword;
	private String newPassword;
	private String email;
}
