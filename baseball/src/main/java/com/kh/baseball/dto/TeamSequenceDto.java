package com.kh.baseball.dto;

import lombok.Data;

@Data
public class TeamSequenceDto {
	private String teamName;
	private int sequenceWin, sequenceLose, sequenceDraw;
}
