package com.kh.baseball.dto;

import lombok.Data;

@Data
public class SeatGroupDto {
	private int seatNo, seatAreaNo,seatCount, seatRow, seatCol, stadiumNo, seatAreaPrice;
	private String stadiumName, seatStatus, seatAreaZone;

}
