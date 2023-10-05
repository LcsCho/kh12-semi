package com.kh.baseball.dao;

import java.util.List;

import com.kh.baseball.dto.MatchDto;
import com.kh.baseball.vo.MatchVO;
import com.kh.baseball.vo.PaginationVO;

public interface MatchDao {
	
	int sequence();
	void insertMatch(MatchDto matchDto);
	boolean delete(int matchNo);
	boolean update(MatchDto matchDto);
	boolean updateDate(MatchDto matchDto);
	MatchDto selectOne(int matchNo);
	List<MatchDto> selectList(PaginationVO vo);
	MatchVO selectOneReservation(int matchNo);
	List<MatchVO> selectNoList();
	
	// 해당 날짜 경기 조회
	boolean checkDuplicate(MatchDto matchDto, String subStrMatchDate);
	
	
	boolean seatStatusUpdateByMatchFinish(int matchNo);
	int countList(PaginationVO vo);
}
