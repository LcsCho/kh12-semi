package com.kh.baseball.dao;

import java.util.List;

import com.kh.baseball.dto.ReservationCancelDto;
import com.kh.baseball.dto.ReservationDto;

public interface ReservationDao {
	void insert(ReservationDto reservationDto);
	List<ReservationDto> selectList(String memberId);
	ReservationDto selectOne(int reservationNo);
	boolean cancel(int reservationNo);
	List<ReservationCancelDto> cancelList(String memberId);
	
}
