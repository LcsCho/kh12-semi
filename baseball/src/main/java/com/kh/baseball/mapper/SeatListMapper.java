package com.kh.baseball.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Component;

import com.kh.baseball.dto.SeatListDto;
@Component
public class SeatListMapper implements RowMapper<SeatListDto>{

	@Override
	public SeatListDto mapRow(ResultSet rs, int rowNum) throws SQLException {
		SeatListDto seatListDto = new SeatListDto();
		seatListDto.setSeatNo(rs.getInt("seat_no"));
		seatListDto.setSeatAreaPrice(rs.getInt("seat_area_price"));
		seatListDto.setSeatAreaNo(rs.getInt("seat_area_no"));
		seatListDto.setSeatRow(rs.getInt("seat_row"));
		seatListDto.setSeatCol(rs.getInt("seat_col"));
		seatListDto.setStadiumNo(rs.getInt("stadium_no"));
		seatListDto.setSeatAreaZone(rs.getString("seat_area_zone"));
		seatListDto.setStadiumName(rs.getString("stadium_name"));
		seatListDto.setSeatStatus(rs.getString("seat_status"));
		
		return seatListDto;
	}
	

}
