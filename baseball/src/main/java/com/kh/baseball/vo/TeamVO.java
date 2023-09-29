package com.kh.baseball.vo;

import lombok.Data;

@Data
public class TeamVO {
	private int teamNo;
	private String teamName; 
	private String teamRegion;
	private int teamWin, teamLose, teamDraw, teamMatch;
	private int consequenceWin, consequenceDraw, consequenceLose;
	private float teamWinRate, teamGameGap;
	private int recentWin, recentLose, recentDraw;
}
