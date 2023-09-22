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
		teamDto.setTeamNo(rs.getInt("team_no"));
		teamDto.setTeamName(rs.getString("team_name"));
		teamDto.setTeamRegion(rs.getString("team_region"));
		teamDto.setTeamWin(rs.getInt("team_win"));
		teamDto.setTeamLose(rs.getInt("team_lose"));
		teamDto.setTeamDraw(rs.getInt("team_draw"));
		teamDto.setTeamMatch(rs.getInt("team_match"));
		teamDto.setTeamWinRate(rs.getFloat("team_win_rate"));
		teamDto.setTeamGameGap(rs.getFloat("team_game_gap"));
		return teamDto;
	}

}
