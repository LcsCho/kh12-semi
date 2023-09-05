package com.kh.baseball.dto;

import java.sql.Date;

import lombok.Data;

@Data
public class ReservationDto {

	private int reservationNo;
	private String matchId;
	private int seatNo;
	private String homeTeam;
	private String awayTeam;
	private int seatAreaNo;
	private Date reservationDate;
	private int reservationPrice;
}
