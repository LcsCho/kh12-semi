package com.kh.baseball.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Component;

import com.kh.baseball.dto.TeamSequenceDto;

@Component
public class TeamSequenceMapper implements RowMapper<TeamSequenceDto>{

	@Override
	public TeamSequenceDto mapRow(ResultSet rs, int rowNum) throws SQLException {
		TeamSequenceDto teamSequenceDto = new TeamSequenceDto();
		teamSequenceDto.setTeamName(rs.getString("team_name"));
		teamSequenceDto.setSequenceWin(rs.getInt("sequence_win"));
		teamSequenceDto.setSequenceLose(rs.getInt("sequence_lose"));
		teamSequenceDto.setSequenceDraw(rs.getInt("sequence_draw"));
		return teamSequenceDto;
	}

}
