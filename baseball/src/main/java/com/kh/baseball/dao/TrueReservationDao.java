package com.kh.baseball.dao;

import java.util.List;

import com.kh.baseball.dto.ReservationCancelDto;
import com.kh.baseball.dto.SeatListDto;
import com.kh.baseball.dto.TrueReservationDto;
import com.kh.baseball.vo.ReservationVO;

public interface TrueReservationDao {
	
	//int sequence();
	void insert(TrueReservationDto trueReservationDto);
	List<ReservationVO> selectList(int matchNo);
	List<SeatListDto> findSeatForReservation( int matchNo ,int seatAreaNo);
	//void insert(String[] seatNoArray, TrueReservationDto trueReservationDto);
	
	boolean seatStatusUpdate(TrueReservationDto trueReservationDto);
	
	
	List<ReservationVO> reservationList(String memberId);
	
	
	ReservationVO reservationSelectOne(int reservationNo);
	
	//티켓의 개수와 좌석의 배열을 저장하는 메소드를 만들어야함
	//티켓의 수를 가져오고 좌석을 배열화 시킴
	boolean reservationDeleteByTicket(TrueReservationDto trueReservationDto);
	
	
	void reservationCancelInsertBySeatNo(ReservationCancelDto reservationCancelDto);
	
	
	
	
}
