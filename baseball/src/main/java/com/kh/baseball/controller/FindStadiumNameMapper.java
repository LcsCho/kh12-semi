package com.kh.baseball.controller;


import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Component;

import com.kh.baseball.dto.FindStadiumNameDto;

@Component
public class FindStadiumNameMapper implements RowMapper<FindStadiumNameDto>{

	@Override
	public FindStadiumNameDto mapRow(ResultSet rs, int rowNum) throws SQLException {
		FindStadiumNameDto nameDto = new FindStadiumNameDto();
		nameDto.setSeatAreaNo(rs.getInt("seat_area_no"));
		nameDto.setSeatAreaZone(rs.getString("seat_area_zone"));
		nameDto.setSeatAreaPrice(rs.getInt("seat_area_price"));
		nameDto.setStadiumName(rs.getString("stadium_name"));
		nameDto.setStadiumNo(rs.getInt("stadium_no"));

		return nameDto;
	}

}
