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
		seatDto.setSeatId(rs.getInt("seat_id"));
		seatDto.setSeatAreaNo(rs.getInt("seat_area_no"));
		seatDto.setSeatRow(rs.getInt("seat_row"));
		seatDto.setSeatCol(rs.getInt("seat_col"));
		seatDto.setSeatStatus(rs.getString("seat_status"));
		return seatDto;
	}
}
