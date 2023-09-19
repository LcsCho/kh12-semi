package com.kh.baseball.dto;

import java.sql.Date;

import lombok.Data;

@Data
public class MatchDto {
	private int matchNo;
	private String teamHome, teamAway;
	private int stadiumNo;
	private Date matchDate;
	private int matchHomeScore, matchAwayScore;
}
