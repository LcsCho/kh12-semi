package com.kh.baseball.dao;

import com.kh.baseball.dto.TrueReservationDto;

public interface TrueReservationDao {
	
	int sequence();
	void insert(TrueReservationDto trueReservationDto);
}
