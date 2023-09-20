package com.kh.baseball.dto;

import lombok.Data;

@Data
public class TeamDto {
	private int teamNo;
	private String teamName; 
	private String teamRegion;
	private String teamLogo;
	private int teamWin, teamLose, teamDraw;
}
