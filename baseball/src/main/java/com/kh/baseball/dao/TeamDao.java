package com.kh.baseball.dao;

import java.util.List;


import com.kh.baseball.dto.TeamDto;

public interface TeamDao {
	int sequenceTeam();
	void insert(TeamDto teamDto);
	TeamDto selectOne(int teamNo);
	List<TeamDto> selectList();
	boolean update(TeamDto teamDto);
	boolean delete(int teamNo);
}
