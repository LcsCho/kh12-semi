package com.kh.baseball.dao;

import java.util.List;

import com.kh.baseball.dto.ReservationDto;

public interface ReservationDao {
	void insert(ReservationDto reservationDto);
	List<ReservationDto> selectList(String memberId);
	boolean update(ReservationDto reservationDto);
	boolean delete(int reservationNo);
	
}
