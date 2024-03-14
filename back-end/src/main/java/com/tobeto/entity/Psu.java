package com.tobeto.entity;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import lombok.Data;

@Entity
@Data
public class Psu {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	private int watt;
	private String efficiency;
	private boolean modular;
	private String type;
	private boolean pcie_gen_5_support;
	

}
