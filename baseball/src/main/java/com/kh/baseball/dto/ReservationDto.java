package com.kh.baseball.dto;

import java.sql.Date;

import lombok.Data;

@Data
public class ReservationDto {
	private int reservationNo;
	private int matchNo;
	private int seatNo;
	private String homeTeam, awayTeam;
	private String memberId;
	private String stadiumName;
	private Date reservationDate;
	private int seatAreaPrice;
	private int stadiumNo;
	private String seatAreaZone;
	private int seatRow, seatCol;
	private int seatAreaNo;
	private Date matchDate;
	private int reservationTicket;
}
