package com.kh.baseball.dto;

import lombok.Data;

@Data
public class SeatListDto {
	//좌석번호 좌석구역번호 경기장이름 좌석열 좌석행 좌석상태 
	private int seatNo, seatAreaNo, seatCount ,seatRow, seatCol, stadiumNo, seatAreaPrice;
	private String stadiumName, seatStatus, seatAreaZone;

}
