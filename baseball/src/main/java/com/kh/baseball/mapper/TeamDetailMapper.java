package com.kh.baseball.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Component;

import com.kh.baseball.dto.TeamDto;

@Component
public class TeamDetailMapper implements RowMapper<TeamDto>{

	@Override
	public TeamDto mapRow(ResultSet rs, int rowNum) throws SQLException {
		TeamDto teamDetailDto = new TeamDto();
		teamDetailDto.setTeamNo(rs.getInt("team_no"));
		teamDetailDto.setTeamName(rs.getString("team_name"));
		teamDetailDto.setTeamRegion(rs.getString("team_region"));
		teamDetailDto.setTeamLogo(rs.getString("team_logo"));
		teamDetailDto.setTeamWin(rs.getInt("team_win"));
		teamDetailDto.setTeamLose(rs.getInt("team_lose"));
		teamDetailDto.setTeamDraw(rs.getInt("team_draw"));
		return teamDetailDto;
	}

}
