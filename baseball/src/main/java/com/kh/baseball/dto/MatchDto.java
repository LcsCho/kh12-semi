package com.kh.baseball.dto;

import java.sql.Date;

import lombok.Data;

@Data
public class MatchDto {
	private int matchNo, stadiumNo;
	private String homeTeam, awayTeam;
	private Date matchDate;
	private int matchHomeScore,matchAwayScore;
	
}
