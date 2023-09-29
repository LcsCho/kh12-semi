package com.kh.baseball.dto;

import java.sql.Date;

import lombok.Data;

@Data
public class ReservationCancelDto {
	
	private int reservationNo , seatNo, reservationCancelNo;
	private Date reservationCancelDate;
	
	
}
