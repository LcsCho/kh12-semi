package com.kh.baseball.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class StadiumDaoImpl implements StadiumDao {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	@Override
	public int sequence() {
		String sql = "select board_seq.nextval from dual";
		return jdbcTemplate.queryForObject(sql, int.class);
	}

	@Override
	public void insertStadium() {
		String sql = "insert into stadium(stadium_no,stadium_name) values(?,?)";

	}

}
