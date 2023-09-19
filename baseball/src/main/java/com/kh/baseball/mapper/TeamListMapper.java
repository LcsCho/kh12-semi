package com.kh.baseball.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Component;

import com.kh.baseball.dto.TeamDto;

@Component
public class TeamListMapper implements RowMapper<TeamDto>{

	@Override
	public TeamDto mapRow(ResultSet rs, int rowNum) throws SQLException {
		TeamDto teamListDto = new TeamDto();
		teamListDto.setTeamName(rs.getString("team_name"));
		teamListDto.setTeamWin(rs.getInt("team_win"));
		teamListDto.setTeamLose(rs.getInt("team_lose"));
		teamListDto.setTeamDraw(rs.getInt("team_draw"));
		return teamListDto;
	}

}
