package com.kh.baseball.dao;

import java.util.List;

import com.kh.baseball.dto.StadiumDto;

public interface StadiumDao {
	
	void insert(StadiumDto stadiumDto);
	int sequenceStadium();
	StadiumDto selectOne(int stadiumNo);
	List<StadiumDto> selectList();

}
