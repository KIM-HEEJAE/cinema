package com.example.cinema.dao;

import java.util.List;


import com.example.cinema.dto.ProductDTO;

public interface ProductDAO {
	List<ProductDTO> list();

	List<ProductDTO> category(int product_type);

	ProductDTO detail(int product_code);

	void insert(ProductDTO dto);

	void update(ProductDTO dto);

	void delete(int product_code);
	
	List<ProductDTO> cart();
}
