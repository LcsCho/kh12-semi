package com.kh.baseball.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class ReservationVO {
	private int reservationNo;
	private int matchNo;
	private int seatNo;
	private String homeTeam;//사용
	private String awayTeam;//사용
	private String memberId;
	private String stadiumName;
	private Date reservationDate;
	private int seatAreaNo;
	private int seatAreaPrice;
	private int stadiumNo;//사용
	private String seatAreaZone;
	private int seatRow, seatCol;
	private Date matchDate;
	private int reservationTicket;
	//캔슬 리스트 출력을 위한 Object

	private int reservationCancelNo;
	private Date reservationCancelDate;
	
}
