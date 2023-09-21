package com.kh.baseball.dao;

import java.util.List;

import com.kh.baseball.dto.SeatAreaDto;

public interface SeatAreaDao {
	void insert(SeatAreaDto seatAreaDto);
	List<SeatAreaDto> selectList();

}
