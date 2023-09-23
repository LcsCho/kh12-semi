package com.kh.baseball.dao;

import java.util.List;

import com.kh.baseball.dto.SeatDto;
import com.kh.baseball.dto.SeatListDto;

public interface SeatDao {
	int sequenceSeat();
	void insert(SeatDto seatDto);
	SeatDto selectOne(int seatNo);
	List<SeatDto> selectList();
	boolean delete(int seatNo);
	
	//int bulkInsert(SeatDto seatDto, int col, int row);
	void insertSeats(SeatDto seatDto);
	List<SeatListDto> seatSeletList();
	SeatListDto selectForSeatUpdate(int seatCol, int seatRow, String seatAreaZone, String stadiumName);
	boolean seatStatusUpsate(SeatListDto seatListDto);
	
	
	
}
