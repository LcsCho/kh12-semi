package com.kh.baseball.dto;

import java.sql.Date;

import lombok.Data;

@Data
public class MemberBlockDto {
	private String memberId;
	private Date blockTime;
}
