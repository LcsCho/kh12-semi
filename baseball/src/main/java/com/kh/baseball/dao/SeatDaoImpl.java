package com.kh.baseball.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.kh.baseball.dto.SeatDto;
import com.kh.baseball.mapper.SeatMapper;

@Repository
public class SeatDaoImpl implements SeatDao{
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	@Autowired
	private SeatMapper seatMapper;

	@Override
	public void insert(SeatDto seatDto) {
		String sql = "insert into seat(seat_no, seat_area_zone) "
				+ "values(?, ?)";
		Object[] data = {seatDto.getSeatNo(), seatDto.getSeatAreaZone()};
		
		jdbcTemplate.update(sql, data);
		
	}

}
