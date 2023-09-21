package com.kh.baseball.dao;

import java.util.List;

import com.kh.baseball.dto.SeatDto;

public interface SeatDao {
	int sequence();
	void insert(SeatDto seatDto);
	SeatDto selectOne(int seatId);
	List<SeatDto> selectList();
	boolean delete(int seatId);
	
	
	int findSeatAreaNo(int seatAreaNo);
}
