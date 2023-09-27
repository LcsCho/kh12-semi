package com.kh.baseball.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Component;

import com.kh.baseball.vo.MatchVO;

@Component
public class MatchVoMapper implements RowMapper<MatchVO>{

	@Override
	public MatchVO mapRow(ResultSet rs, int rowNum) throws SQLException {
		MatchVO matchVo = new MatchVO();
		matchVo.setMatchNo(rs.getInt("match_no"));
		matchVo.setHomeTeamNo(rs.getInt("home_team_no"));
		matchVo.setAwayTeamNo(rs.getInt("away_team_no"));
		matchVo.setHomeTeam(rs.getString("home_team"));
		matchVo.setAwayTeam(rs.getString("away_team"));
		matchVo.setStadiumName(rs.getString("stadium_name"));
		matchVo.setMatchDate(rs.getTimestamp("match_date"));
		matchVo.setMatchHomeScore(rs.getInt("match_home_score"));
		matchVo.setMatchAwayScore(rs.getInt("match_away_score"));
		return matchVo;
	}

	
	
}
