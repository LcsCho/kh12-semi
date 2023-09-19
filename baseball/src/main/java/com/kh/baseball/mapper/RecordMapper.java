package com.kh.baseball.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Component;

import com.kh.baseball.dto.RecordDto;

@Component
public class RecordMapper implements RowMapper<RecordDto>{

	@Override
	public RecordDto mapRow(ResultSet rs, int rowNum) throws SQLException {
		RecordDto recordDto = new RecordDto();
		recordDto.setRecordNo(rs.getInt("record_no"));
		recordDto.setMatchNo(rs.getInt("match_no"));
		recordDto.setTeamHome(rs.getString("team_home"));
		recordDto.setTeamAway(rs.getString("team_away"));
		recordDto.setMatchHomeScore(rs.getInt("match_home_score"));
		recordDto.setMatchAwayScore(rs.getInt("match_away_score"));
		recordDto.setHomeResult(rs.getString("home_result"));
		recordDto.setHomeResult(rs.getString("away_result"));
		return recordDto;
	}
	
}
