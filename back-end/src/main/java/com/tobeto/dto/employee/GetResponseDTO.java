package com.tobeto.dto.employee;

import java.util.UUID;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class GetResponseDTO {
	private UUID id;
	private String name;
	private String password;
	private String email;
	private String rol;

}
