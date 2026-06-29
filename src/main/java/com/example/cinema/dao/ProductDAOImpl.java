package com.example.cinema.dao;

import java.util.List;



import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.cinema.dto.ProductDTO;

@Repository
public class ProductDAOImpl implements ProductDAO {
@Autowired
SqlSession sqlSession;

	@Override
	public List<ProductDTO> list() {
		return sqlSession.selectList("product.list");
	}

	
	@Override
	public List<ProductDTO> category(int product_type) {
		return sqlSession.selectList("product.category", product_type);
	}

	@Override
	public ProductDTO detail(int product_code) {
		return sqlSession.selectOne("product.detail",product_code);
	}
	
	

	@Override
	public void insert(ProductDTO dto) {
	sqlSession.insert("product.insert_product", dto);
	}

	@Override
	public void update(ProductDTO dto) {
		sqlSession.update("product.update_product",dto);

	}

	@Override
	public void delete(int product_code) {
		sqlSession.delete("product.delete_product", product_code);
	}


	@Override
	public List<ProductDTO> cart() {
		// TODO Auto-generated method stub
		return null;
	}

}
