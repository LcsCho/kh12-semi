package com.kh.baseball.dto;

import lombok.Data;

@Data
public class SeatDto {
	int seatId , seatAreaNo, seatRow, seatCol;
	String seatStatus;
}
