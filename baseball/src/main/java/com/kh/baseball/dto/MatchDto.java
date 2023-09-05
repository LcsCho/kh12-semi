package com.kh.baseball.dto;


import java.sql.Date;

import lombok.Data;

@Data
public class MatchDto {
	private String matchId;
	private String homeTeam;
	private String awayTeam;
	private String stadiumId;
	private Date matchDate;
}
