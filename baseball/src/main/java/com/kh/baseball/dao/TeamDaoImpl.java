package com.kh.baseball.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.kh.baseball.dto.TeamDto;
import com.kh.baseball.mapper.TeamDetailMapper;
import com.kh.baseball.mapper.TeamListMapper;

@Repository
public class TeamDaoImpl implements TeamDao{
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	@Autowired
	private TeamDetailMapper teamDetailMapper;
	
	@Autowired
	private TeamListMapper teamListMapper;
	
	@Override
	public int sequenceTeam() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public void insert(TeamDto teamDto) {
		String sql = "insert into team(team_name, team_region) "
				+ "values(?, ?)";
		Object[] data = {teamDto.getTeamName(), teamDto.getTeamRegion()};
		jdbcTemplate.update(sql, data);
	}

	@Override
	public TeamDto selectOne(String teamName) {
		String sql = "select * from team where team_name = ?";
		Object[] data = {teamName};
		List<TeamDto> list = jdbcTemplate.query(sql, teamDetailMapper, data);
		return list.isEmpty() ? null : list.get(0);
	}

	@Override
	public List<TeamDto> selectList() {
		String sql = "select * from team order by team_win desc";
		return jdbcTemplate.query(sql, teamListMapper);
	}


}
