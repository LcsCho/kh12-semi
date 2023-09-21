package com.kh.baseball.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.kh.baseball.dto.TeamDto;
import com.kh.baseball.mapper.TeamMapper;

@Repository
public class TeamDaoImpl implements TeamDao{
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	@Autowired
	private TeamMapper teamMapper;
	
	@Override
	public int sequenceTeam() {
		String sql = "select team_seq.nextval from dual";
		return jdbcTemplate.queryForObject(sql, int.class);
	}

	@Override
	public void insert(TeamDto teamDto) {
		String sql = "insert into team(team_no, team_name, team_region) "
				+ "values(?, ?, ?)";
		Object[] data = {teamDto.getTeamNo(), teamDto.getTeamName(), teamDto.getTeamRegion()};
		jdbcTemplate.update(sql, data);
	}

	@Override
	public TeamDto selectOne(int teamNo) {
		String sql = "select * from team where team_no = ?";
		Object[] data = {teamNo};
		List<TeamDto> list = jdbcTemplate.query(sql, teamMapper, data);
		return list.isEmpty() ? null : list.get(0);
	}

	@Override
	public List<TeamDto> selectList() {
		String sql = "select * from team order by team_game_gap, team_win_rate desc";
		return jdbcTemplate.query(sql, teamMapper);
	}

	@Override
	public boolean update(TeamDto teamDto) {
		String sql = "update team set "
				+ "team_name = ?, team_region = ? "
				+ "where team_no = ?";
		Object[] data = {
			teamDto.getTeamName(), teamDto.getTeamRegion(),
			teamDto.getTeamNo()
		};
		return jdbcTemplate.update(sql, data) > 0;
	}

	@Override
	public boolean delete(int teamNo) {
		String sql = "delete from team where team_no = ?";
		Object[] data = {teamNo};
		return jdbcTemplate.update(sql, data) > 0;
	}


}
