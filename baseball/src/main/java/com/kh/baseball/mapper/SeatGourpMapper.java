package com.kh.baseball.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Component;

import com.kh.baseball.dto.SeatGroupDto;

@Component
public class SeatGourpMapper implements RowMapper<SeatGroupDto>{

	@Override
	public SeatGroupDto mapRow(ResultSet rs, int rowNum) throws SQLException {
		   SeatGroupDto seatGroupDto = new SeatGroupDto();
		   seatGroupDto.setSeatAreaNo(rs.getInt("seat_area_no"));
		   seatGroupDto.setStadiumName(rs.getString("stadium_name"));
	        seatGroupDto.setSeatAreaZone(rs.getString("seat_area_zone"));
	        seatGroupDto.setSeatCount(rs.getInt("seat_count"));
	        return seatGroupDto;
	}
	
	

}
