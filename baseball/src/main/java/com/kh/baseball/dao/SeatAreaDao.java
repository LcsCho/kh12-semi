package com.kh.baseball.dao;

import com.kh.baseball.dto.SeatAreaDto;
import com.kh.baseball.dto.StadiumDto;

public interface SeatAreaDao {
	void insert(SeatAreaDto seatAreaDto, StadiumDto stadiumDto);
}
