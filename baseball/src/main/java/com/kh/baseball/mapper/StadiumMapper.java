package com.kh.baseball.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Component;

import com.kh.baseball.dto.StadiumDto;

@Component
public class StadiumMapper implements RowMapper<StadiumDto>{

	@Override
	public StadiumDto mapRow(ResultSet rs, int rowNum) throws SQLException {
		StadiumDto stadiumDto = new StadiumDto();
		stadiumDto.setStadiumNo(rs.getInt("stadium_no"));
		stadiumDto.setStadiumName(rs.getString("stadium_name"));
		stadiumDto.setStadiumZone(rs.getString("stadium_zone"));
		stadiumDto.setStadiumZonePrice(rs.getInt("stadium_zone_price"));

		return stadiumDto;
	}

}
