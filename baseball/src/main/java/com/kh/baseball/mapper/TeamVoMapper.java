package com.kh.baseball.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Component;

import com.kh.baseball.vo.TeamVO;

@Component
public class TeamVoMapper implements RowMapper<TeamVO>{

	@Override
	public TeamVO mapRow(ResultSet rs, int rowNum) throws SQLException {
		TeamVO teamVO = new TeamVO();
		teamVO.setTeamNo(rs.getInt("team_no"));
		teamVO.setTeamName(rs.getString("team_name"));
		teamVO.setTeamRegion(rs.getString("team_region"));
		teamVO.setTeamWin(rs.getInt("team_win"));
		teamVO.setTeamLose(rs.getInt("team_lose"));
		teamVO.setTeamDraw(rs.getInt("team_draw"));
		teamVO.setTeamMatch(rs.getInt("team_match"));
		teamVO.setTeamWinRate(rs.getFloat("team_win_rate"));
		teamVO.setTeamGameGap(rs.getFloat("team_game_gap"));
		teamVO.setRecentWin(rs.getInt("recent_win"));
		teamVO.setRecentLose(rs.getInt("recent_lose"));
		teamVO.setRecentDraw(rs.getInt("recent_draw"));
		teamVO.setConsequenceWin(rs.getInt("consequence_win"));
		teamVO.setConsequenceLose(rs.getInt("consequence_lose"));
		teamVO.setConsequenceDraw(rs.getInt("consequence_draw"));
		return teamVO;
	}

}
