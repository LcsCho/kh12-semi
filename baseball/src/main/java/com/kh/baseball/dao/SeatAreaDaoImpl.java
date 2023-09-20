package com.kh.baseball.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.kh.baseball.dto.SeatAreaDto;
import com.kh.baseball.dto.StadiumDto;
import com.kh.baseball.mapper.SeatAreaMapper;
import com.kh.baseball.mapper.StadiumMapper;

@Repository
public class SeatAreaDaoImpl implements SeatAreaDao{
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	@Autowired
	private SeatAreaMapper seatAreaMapper;
	
	@Autowired
	private StadiumMapper stadiumMapper;
	
	@Override
	public void insert(SeatAreaDto seatAreaDto) {

		String sql = "insert into seat_area(stadium_no, seat_area_zone, seat_area_price) "
				+ "values(?, ?, ?)";
		Object[] data = {seatAreaDto.getStadiumNo(), seatAreaDto.getSeatAreaZone(), seatAreaDto.getSeatAreaPrice()};


		jdbcTemplate.update(sql, data);
	}

}
