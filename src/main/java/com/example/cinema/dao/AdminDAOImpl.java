package com.example.cinema.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.cinema.dto.AdminDTO;

@Repository
public class AdminDAOImpl implements AdminDAO {
	@Autowired
	SqlSession sqlSession;

	@Override
	public AdminDTO login(AdminDTO dto) {
		return sqlSession.selectOne("admin.login", dto);
	}

}
