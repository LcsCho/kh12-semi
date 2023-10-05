package com.kh.baseball.dao;

import java.util.List;

import com.kh.baseball.dto.DeleteReservationDto;
import com.kh.baseball.dto.TrueReservationDto;
import com.kh.baseball.vo.PaginationVO;
import com.kh.baseball.vo.ReservationVO;
import com.kh.baseball.vo.SeatListVO;

public interface TrueReservationDao {
	
	//int sequence();
	void insert(TrueReservationDto trueReservationDto);
	List<ReservationVO> selectList(int matchNo);
	ReservationVO selectOneTeam(int matchNo);
	
	
	
	List<SeatListVO> findSeatForReservation( int matchNo ,int seatAreaNo);
	//void insert(String[] seatNoArray, TrueReservationDto trueReservationDto);
	
	boolean seatStatusUpdate(TrueReservationDto trueReservationDto);
	
	
	List<ReservationVO> reservationList(PaginationVO vo,String memberId);
	
	
	ReservationVO reservationSelectOne(int reservationNo);
	
	//티켓의 개수와 좌석의 배열을 저장하는 메소드를 만들어야함
	//티켓의 수를 가져오고 좌석을 배열화 시킴
	//boolean reservationDeleteByTicket(TrueReservationDto trueReservationDto);
	
	
	//void reservationCancelInsertBySeatNo(ReservationCancelDto reservationCancelDto,String memberId);

	int countList(PaginationVO vo, String memberId);
	boolean reservationDeleteByTicket(DeleteReservationDto deleteReservationDto);
	
	
}
