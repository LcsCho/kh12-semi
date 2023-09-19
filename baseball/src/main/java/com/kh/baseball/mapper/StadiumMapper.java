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
		stadiumDto.setStadiumNo(rs.getInt(""));
		return stadiumDto;
	}

}
