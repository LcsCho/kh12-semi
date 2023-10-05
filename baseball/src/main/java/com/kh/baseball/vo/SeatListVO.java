package com.kh.baseball.vo;

import lombok.Data;

@Data
public class SeatListVO {
	//좌석번호 좌석구역번호 경기장이름 좌석열 좌석행 좌석상태 
	private int seatNo, seatAreaNo, seatCount ,seatRow, seatCol, stadiumNo, seatAreaPrice, reservationNo;
	private String stadiumName, seatStatus, seatAreaZone;

}
