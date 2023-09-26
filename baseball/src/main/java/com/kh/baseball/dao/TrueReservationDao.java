package com.kh.baseball.dao;

import java.util.List;

import com.kh.baseball.dto.TrueReservationDto;
import com.kh.baseball.vo.ReservationVO;

public interface TrueReservationDao {
	
	int sequence();
	void insert(TrueReservationDto trueReservationDto);
	List<ReservationVO> selectList(int matchNo);
}
