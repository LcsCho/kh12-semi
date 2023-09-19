package com.kh.baseball.dto;

import lombok.Data;

@Data
public class RecordDto {
	private int recordNo;
	private int matchNo;
	private String teamHome, teamAway;
	private int matchHomeScore, matchAwayScore;
	private String homeResult, awayResult;
}
