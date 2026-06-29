package com.example.cinema.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ProductDTO {
	
	private int product_code;
	private int product_type;
	private String product_name;
	private int price;
	private String description;
	private String filename;

}
