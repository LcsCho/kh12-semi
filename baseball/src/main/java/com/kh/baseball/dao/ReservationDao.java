package com.kh.baseball.dao;

import java.util.List;

import com.kh.baseball.dto.ReservationDto;

public interface ReservationDao {
	
	int sequence();
	void insert(ReservationDto reservationDto);
	List<ReservationDto> selectList();
	ReservationDto selectOne(int reservationNo);
	boolean update(ReservationDto reservationDto);
	boolean delete(int reservationNo);
	
}
