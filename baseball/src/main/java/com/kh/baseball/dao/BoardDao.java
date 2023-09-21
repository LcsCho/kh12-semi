package com.kh.baseball.dao;

import java.util.List;

import com.kh.baseball.dto.BoardDto;
import com.kh.baseball.vo.PaginationVO;

public interface BoardDao {
	
	int sequence();
	void insert(BoardDto boardDto); 
	BoardDto selectOne(int boardNo);
	boolean updateBoard(BoardDto boardDto);
	boolean deleteBoard(int boardNo);
	
	boolean updateBoardReadcount(int boardNo);
	boolean updateBoardUtime(int boardNo);
	
	List<BoardDto> selectList();	
	List<BoardDto> selectListByPage(PaginationVO vo);
	
	int countList(PaginationVO vo);
	
}
