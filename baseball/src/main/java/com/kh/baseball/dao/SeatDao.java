package com.kh.baseball.dao;

import java.util.List;

import com.kh.baseball.dto.SeatDto;

public interface SeatDao {
	int sequenceSeat();
	void insert(SeatDto seatDto);
	SeatDto selectOne(int seatNo);
	List<SeatDto> selectList();
	boolean delete(int seatNo);
	
	
	
}
