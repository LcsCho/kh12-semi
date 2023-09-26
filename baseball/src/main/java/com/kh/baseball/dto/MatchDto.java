package com.kh.baseball.dto;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class MatchDto {
	private int matchNo;
	private String homeTeam, awayTeam, stadiumName;
	private Timestamp matchDate;
	private int matchHomeScore,matchAwayScore;
	
}
