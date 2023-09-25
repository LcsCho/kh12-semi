package com.kh.baseball.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class ReservationVO {
	private int reservationNo;
	private int matchNo;
	private int seatNo;
	private String homeTeam;
	private String awayTeam;
	private String memberId;
	private String stadiumName;
	private Date reservationDate;
	private int seatAreaNo;
	private int seatAreaPrice;
	private int stadiumNo;
	private String seatAreaZone;
	private int seatRow, seatCol;
	private Date matchDate;
}
