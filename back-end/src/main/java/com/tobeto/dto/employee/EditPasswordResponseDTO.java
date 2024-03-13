package com.tobeto.dto.employee;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class EditPasswordResponseDTO {
	private String previousPassword;
	private String newPassword;
	private String email;
	private String message;

}
