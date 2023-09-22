package com.kh.baseball.dao;

import com.kh.baseball.dto.AttachDto;

public interface AttachDao {
	int sequence();
	void insert(AttachDto attachDto);
	AttachDto selectOne(int attachNo);
}
