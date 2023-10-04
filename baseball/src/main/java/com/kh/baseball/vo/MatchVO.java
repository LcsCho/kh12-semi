package com.kh.baseball.vo;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class MatchVO {
	private int matchNo;
	private int homeTeamNo, awayTeamNo;
	private String homeTeam, awayTeam, stadiumName;
	private Timestamp matchDate;
	private int matchHomeScore,matchAwayScore;
}
