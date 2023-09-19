package com.kh.baseball.dao;

import com.kh.baseball.dto.StadiumDto;

public interface StadiumDao {
	
	void insertStadium(StadiumDto stadiumDto);

	int sequence();

}
