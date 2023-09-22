package com.kh.baseball.dto;

import java.sql.Date;

import lombok.Data;

@Data
public class MatchDto {
	private int matchNo;
	private String homeTeam, awayTeam, stadiumName;
	private Date matchDate;
	private int matchHomeScore,matchAwayScore;
	
}
