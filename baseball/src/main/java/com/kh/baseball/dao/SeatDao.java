package com.kh.baseball.dao;

import java.util.List;

import com.kh.baseball.dto.SeatDto;
import com.kh.baseball.dto.SeatGroupDto;
import com.kh.baseball.dto.SeatListDto;
import com.kh.baseball.vo.PaginationVO;

public interface SeatDao {
	int sequenceSeat();
	void insert(SeatDto seatDto);
	List<SeatDto> selectList();
	boolean delete(int seatNo);
	
	//다중 좌석 insert를 위한 구문
	void insertSeats(SeatDto seatDto);
	// 좌석상태와 경기장이름 좌석구역을 확인 할 수 있는 리스트
	List<SeatListDto> seatSeletList();
	//좌석 상태 업테이트
	boolean seatStatusUpsate(SeatListDto seatListDto);
	//좌석 상태 업데이트를 위한 조회구문
	SeatListDto selectForSeatUpdate(String seatAreaZone, int seatCol, int seatRow, String stadiumName);
	//좌석 좌석구역 경기장 조인해서 detail출력을 위한 구문 
	SeatListDto selectOne(int seatNo);
	//좌석 구역별 리스트 출력을 위한 DAO
	List<SeatListDto> seatGroupZoneList(PaginationVO vo,String seatAreaZone, String stadiumName);
	List<SeatGroupDto> seatGroupStadiumList(String stadiumName);

	int countList(PaginationVO vo,String seatAreaZone, String stadiumName);
	
	
	
}
