package com.kh.baseball.dto;

import lombok.Data;

@Data
public class SeatDto {
	int seatNo, seatAreaNo, seatRow, seatCol;
	String seatStatus;
}
