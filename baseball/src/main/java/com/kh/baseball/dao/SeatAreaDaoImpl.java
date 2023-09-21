package com.kh.baseball.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.kh.baseball.dto.SeatAreaDto;
import com.kh.baseball.mapper.SeatAreaMapper;

@Repository
public class SeatAreaDaoImpl implements SeatAreaDao{
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	@Autowired
	private SeatAreaMapper seatAreaMapper;
	
	@Override
	public void insert(SeatAreaDto seatAreaDto) {

		String sql = "insert into seat_area(stadium_no, seat_area_zone, seat_area_price) "
				+ "values(?, ?, ?)";
		Object[] data = {seatAreaDto.getStadiumNo(), seatAreaDto.getSeatAreaZone(), seatAreaDto.getSeatAreaPrice()};


		jdbcTemplate.update(sql, data);
	}

	@Override
	public List<SeatAreaDto> selectList() {
		String sql = "select * from seat_area order by seat_area_zone asc";
		return jdbcTemplate.query(sql, seatAreaMapper);
	}
	

}
