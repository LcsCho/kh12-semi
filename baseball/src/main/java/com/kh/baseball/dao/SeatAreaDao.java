package com.kh.baseball.dao;


import com.kh.baseball.dto.SeatAreaDto;

public interface SeatAreaDao {
	int sequenceSeatArea();
	void insert(SeatAreaDto seatAreaDto);

}
