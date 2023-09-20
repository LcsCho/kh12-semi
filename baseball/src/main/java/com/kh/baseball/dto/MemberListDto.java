package com.kh.baseball.dto;

import java.sql.Date;

import lombok.Data;

@Data
public class MemberListDto {
	private String memberId;
	private String memberPw;
	private String memberNick;
	private String memberTel;
	private Date memberBirth;
	private String memberEmail;
	private Date memberJoin;
	private Date memberLastLogin;
	private Date memberLastUpdate;
	private String memberLevel;
	private String memberPost;
	private String memberAddr1;
	private String memberAddr2;
	
	private String block; //차단 여부
}
