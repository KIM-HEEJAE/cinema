package com.example.cinema.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.cinema.dto.EventDTO;

@Repository
public class EventDAOImpl implements EventDAO {
	@Autowired
	SqlSession sqlSession;

	@Override
	public EventDTO view(int num) {
		return sqlSession.selectOne("show.view", num);
	}

	@Override
	public void delete(int num) {
		sqlSession.delete("show.delete", num);

	}

	@Override
	public void insert(EventDTO dto) {
		sqlSession.insert("show.insert",dto);		
	}

}
