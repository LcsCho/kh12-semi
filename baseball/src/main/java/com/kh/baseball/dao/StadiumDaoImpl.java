package com.kh.baseball.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.kh.baseball.dto.StadiumDto;
import com.kh.baseball.mapper.StadiumMapper;

@Repository
public class StadiumDaoImpl implements StadiumDao {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	@Autowired
	private StadiumMapper stadiumMapper;
	@Override
	public int sequenceStadium() {
		String sql = "select stadium_seq.nextval from dual";
		return jdbcTemplate.queryForObject(sql, int.class);
	}

	@Override
	public void insert(StadiumDto stadiumDto) {
		String sql = "insert into stadium(stadium_no, stadium_name, stadium_zone, stadium_zone_price) values(?, ?, ?, ?)";
		Object[] data = {
				stadiumDto.getStadiumNo(), stadiumDto.getStadiumName(), 
				stadiumDto.getStadiumZone(), stadiumDto.getStadiumZonePrice()
		};
		jdbcTemplate.update(sql,data);

	}

	@Override
	public List<StadiumDto>  selectList() {
		String sql = "select * from stadium order by stadium_no asc";
		return jdbcTemplate.query(sql, stadiumMapper);
	}

}
