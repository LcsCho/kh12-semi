package com.kh.baseball.dto;

import java.sql.Date;

import lombok.Data;

@Data
public class TrueReservationDto {
	private int reservationNo;
	private int matchNo;
	private int[] seatNo;
	private int homeTeam, awayTeam;
	private String memberId;
	private int seatAreaNo;
	private Date reservationDate;
	private int reservationTicket;
}
