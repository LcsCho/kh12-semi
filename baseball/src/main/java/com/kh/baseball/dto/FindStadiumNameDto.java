package com.kh.baseball.dto;

import lombok.Data;

@Data
public class FindStadiumNameDto {
	private int seatAreaNo;
	private String seatAreaZone;
	private int seatAreaPrice;
	private String stadiumName;
	private int stadiumNo;
	private int seatCount;

}
