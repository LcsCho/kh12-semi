package com.kh.baseball.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Component;

import com.kh.baseball.dto.SeatDto;

@Component
public class SeatMapper implements RowMapper<SeatDto>{
	
	@Override
	public SeatDto mapRow(ResultSet rs, int rowNum) throws SQLException {
		SeatDto seatDto = new SeatDto();
		seatDto.setSeatNo(rs.getInt("seat_no"));
		seatDto.setSeatAreaZone(rs.getString("seat_area_zone"));
		return seatDto;
	}
}
