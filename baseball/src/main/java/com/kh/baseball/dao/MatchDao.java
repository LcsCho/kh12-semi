package com.kh.baseball.dao;

import java.sql.Timestamp;
import java.util.List;

import com.kh.baseball.dto.MatchDto;
import com.kh.baseball.vo.MatchVO;

public interface MatchDao {
	
	int sequence();
	void insertMatch(MatchDto matchDto);
	boolean delete(int matchNo);
	boolean update(MatchDto matchDto);
	boolean updateDate(MatchDto matchDto);
	MatchDto selectOne(int matchNo);
	List<MatchDto> selectList();
	List<MatchVO> selectNoList();
	
	// 해당 날짜 경기 조회
	List<MatchDto> selectDate(Timestamp matchDate);
	
}
