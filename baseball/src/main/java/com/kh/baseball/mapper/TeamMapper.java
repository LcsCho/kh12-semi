package com.kh.baseball.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Component;

import com.kh.baseball.dto.TeamDto;

@Component
public class TeamMapper implements RowMapper<TeamDto>{

	@Override
	public TeamDto mapRow(ResultSet rs, int rowNum) throws SQLException {
		TeamDto teamDto = new TeamDto();
		teamDto.setTeamName(rs.getString("team_name"));
		teamDto.setTeamRegion(rs.getString("team_region"));
		teamDto.setTeamLogo(rs.getString("team_logo"));
		teamDto.setTeamWin(rs.getInt("team_win"));
		teamDto.setTeamLose(rs.getInt("team_lose"));
		teamDto.setTeamDraw(rs.getInt("team_draw"));
		return teamDto;
	}

}
