package com.kh.baseball.dto;

import java.sql.Date;

import lombok.Data;

@Data
public class ReservationCancelDto {
	
	private int[] reservationNo ;
	private int reservationCancelNo;
	private Date reservationCancelDate;
	private int seatNo;
	private String memberId;
	private int matchNo;
}
