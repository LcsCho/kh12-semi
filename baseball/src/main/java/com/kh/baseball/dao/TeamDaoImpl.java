package com.kh.baseball.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.kh.baseball.dto.AttachDto;
import com.kh.baseball.dto.TeamDto;
import com.kh.baseball.mapper.AttachMapper;
import com.kh.baseball.mapper.TeamMapper;
import com.kh.baseball.mapper.TeamVoMapper;
import com.kh.baseball.vo.PaginationVO;
import com.kh.baseball.vo.TeamVO;

@Repository
public class TeamDaoImpl implements TeamDao {

	@Autowired
	private JdbcTemplate jdbcTemplate;

	@Autowired
	private TeamMapper teamMapper;

	@Autowired
	private AttachMapper attachMapper;
	
	@Autowired
	private TeamVoMapper teamVoMapper;

	@Override
	public int sequenceTeam() {
		String sql = "select team_seq.nextval from dual";
		return jdbcTemplate.queryForObject(sql, int.class);
	}

	@Override
	public void insert(TeamDto teamDto) {
		String sql = "insert into team(team_no, team_name, team_region) " + "values(?, ?, ?)";
		Object[] data = { teamDto.getTeamNo(), teamDto.getTeamName(), teamDto.getTeamRegion() };
		jdbcTemplate.update(sql, data);
	}

	@Override
	public TeamDto selectOne(int teamNo) {
		String sql = "select * from team where team_no = ?";
		Object[] data = { teamNo };
		List<TeamDto> list = jdbcTemplate.query(sql, teamMapper, data);
		return list.isEmpty() ? null : list.get(0);
	}

	@Override
	public List<TeamDto> selectList() {
		String sql = "select * from team order by team_win_rate desc, team_game_gap, team_win desc";
		return jdbcTemplate.query(sql, teamMapper);
	}

	@Override
	public boolean update(TeamDto teamDto) {
		String sql = "update team set " + "team_name = ?, team_region = ? " + "where team_no = ?";
		Object[] data = { teamDto.getTeamName(), teamDto.getTeamRegion(), teamDto.getTeamNo() };
		return jdbcTemplate.update(sql, data) > 0;
	}

	@Override
	public boolean delete(int teamNo) {
		String sql = "delete from team where team_no = ?";
		Object[] data = { teamNo };
		return jdbcTemplate.update(sql, data) > 0;
	}

	// 팀 결과 메서드
	@Override
	public TeamDto selectTeamOne() {
		String sql = "select * from team where rownum = 1 " + "order by team_win_rate desc";
		List<TeamDto> list = jdbcTemplate.query(sql, teamMapper);
		return list.isEmpty() ? null : list.get(0);
	}

	@Override
	public boolean updateWin(String teamName) {
		String sql = "update team set team_win = team_win + 1, team_match = team_match + 1 " + "where team_name = ?";
		Object[] data = { teamName };
		return jdbcTemplate.update(sql, data) > 0;
	}

	@Override
	public boolean updateLose(String teamName) {
		String sql = "update team set team_lose = team_lose + 1, team_match = team_match + 1 " + "where team_name = ?";
		Object[] data = { teamName };
		return jdbcTemplate.update(sql, data) > 0;
	}

	@Override
	public boolean updateDraw(String teamName) {
		String sql = "update team set team_draw = team_draw + 1, team_match = team_match + 1 " + "where team_name = ?";
		Object[] data = { teamName };
		return jdbcTemplate.update(sql, data) > 0;
	}

	@Override
	public boolean updateWinRate(String teamName) {
		String sql = "update team set team_win_rate = " + "case " + "when (team_match - team_draw) = 0 then 0 "
				+ "else round(team_win / (team_match - team_draw), 3) " + "end " + "where team_name = ?";
		Object[] data = { teamName };
		return jdbcTemplate.update(sql, data) > 0;
	}

	@Override
	public boolean updateGameGap() {
		String sql = "update team set team_game_gap = abs((select team_win from ("
				+ "select rownum rn, tmp.* from "
				+ "( "
				+ "select * from team order by team_win_rate desc, team_win desc"
				+ ") tmp"
				+ ") where rn = 1) - team_win) * 0.5 + abs((select team_lose from ( select rownum rn, tmp.* from"
				+ "("
				+ "select * from team order by team_win_rate desc, team_win desc "
				+ ") tmp"
				+ ") where rn = 1) - team_lose) * 0.5";
		return jdbcTemplate.update(sql) > 0;
	}

	@Override
	public void connect(int teamNo, int attachNo) {
		String sql = "insert into team_image values(?, ?)";
		Object[] data = { teamNo, attachNo };
		jdbcTemplate.update(sql, data);
	}

	@Override
	public AttachDto findImage(int teamNo) {
		String sql = "select * from attach " + "where attach_no = (select attach_no from team_image "
				+ "where team_no =?)";
		Object[] data = { teamNo };
		List<AttachDto> list = jdbcTemplate.query(sql, attachMapper, data);
		return list.isEmpty() ? null : list.get(0);
	}
	
	@Override
	public boolean updateSequenceWin(String teamName) {
		String sql = "UPDATE TEAM_SEQUENCE "
				+ "SET SEQUENCE_win = SEQUENCE_win + 1, SEQUENCE_lose = 0, SEQUENCE_draw = 0 "
				+ "WHERE team_name = ?";
		Object[] data = {teamName};
		return jdbcTemplate.update(sql, data) > 0;
	}
	
	@Override
	public boolean updateSequenceDraw(String teamName) {
		String sql = "UPDATE TEAM_SEQUENCE "
				+ "SET SEQUENCE_draw = SEQUENCE_draw + 1, SEQUENCE_lose = 0, SEQUENCE_win = 0 "
				+ "WHERE team_name = ?";
		Object[] data = {teamName};
		return jdbcTemplate.update(sql, data) > 0;
	}
	
	@Override
	public boolean updateSequenceLose(String teamName) {
		String sql = "UPDATE TEAM_SEQUENCE "
				+ "SET SEQUENCE_lose = SEQUENCE_lose + 1, SEQUENCE_win = 0, SEQUENCE_draw = 0 "
				+ "WHERE team_name = ?";
		Object[] data = {teamName};
		return jdbcTemplate.update(sql, data) > 0;
	}
	
	@Override
	public List<TeamVO> list() {
		String sql = "SELECT * from team_vo order by team_win_rate desc, team_game_gap, team_win desc";
		return jdbcTemplate.query(sql, teamVoMapper);
	}



}
