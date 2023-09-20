package com.kh.baseball.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Component;

import com.kh.baseball.dto.SeatAreaDto;
import com.kh.baseball.dto.StadiumDto;

@Component
public class SeatAreaMapper implements RowMapper<SeatAreaDto>{

	@Override
	public SeatAreaDto mapRow(ResultSet rs, int rowNum) throws SQLException {
		SeatAreaDto seatAreaDto = new SeatAreaDto();

		seatAreaDto.setSeatAreaNo(rs.getInt("seat_area_no"));
		seatAreaDto.setSeatAreaZone(rs.getString("seat_area_zone"));

		seatAreaDto.setStadiumNo(rs.getInt("stadium_no"));
		seatAreaDto.setSeatAreaPrice(rs.getInt("seat_area_price"));
		seatAreaDto.setSeatAreaZone(rs.getString("seat_area_zone"));
		
		return seatAreaDto;
	}

}
