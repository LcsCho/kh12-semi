package com.kh.baseball.dto;

import java.sql.Date;
import lombok.Data;

@Data
public class BoardDto {
	
	private int boardNo;
	private String boardWriter;
	private String boardTitle;
	private String boardContent;
	private int boardReadcount;
	private Date boardCtime;
	private Date boardUtime;
	
}
