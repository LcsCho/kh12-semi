package com.kh.baseball.dao;

import java.util.List;


import com.kh.baseball.dto.TeamDto;

public interface TeamDao {
	void insert(TeamDto teamDto);
	TeamDto selectOne(String teamName);
	List<TeamDto> selectList();
}
