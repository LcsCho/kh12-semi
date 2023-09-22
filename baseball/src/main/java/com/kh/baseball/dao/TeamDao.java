package com.kh.baseball.dao;

import java.util.List;

import com.kh.baseball.dto.AttachDto;
import com.kh.baseball.dto.TeamDto;


public interface TeamDao {
	int sequenceTeam();
	void insert(TeamDto teamDto);
	TeamDto selectOne(int teamNo);
	List<TeamDto> selectList();
	boolean update(TeamDto teamDto);
	boolean delete(int teamNo);
	void connect(int teamNo, int attachNo);
	AttachDto findImage(int teamNo);
	
	boolean selectTeamOne();
	boolean updateWin(String teamName);
	boolean updateLose(String teamName);
	boolean updateDraw(String teamName);
	boolean updateWinRate(String teamName);
	boolean updateHomeTeamGameGap(String homeTeam, String awayTeam);
	boolean updateAwayTeamGameGap(String homeTeam, String awayTeam);

}
