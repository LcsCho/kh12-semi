package com.kh.baseball.dao;

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
	
}
