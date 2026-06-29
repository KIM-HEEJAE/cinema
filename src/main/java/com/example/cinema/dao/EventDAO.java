package com.example.cinema.dao;

import com.example.cinema.dto.EventDTO;

public interface EventDAO {
	public EventDTO view(int num);
	 public void delete(int num);
	 public void insert(EventDTO dto);
}
