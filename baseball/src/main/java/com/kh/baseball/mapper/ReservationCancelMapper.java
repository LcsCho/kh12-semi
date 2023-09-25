package com.kh.baseball.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Component;

import com.kh.baseball.dto.ReservationCancelDto;

@Component
public class ReservationCancelMapper implements RowMapper<ReservationCancelDto>{

	@Override
	public ReservationCancelDto mapRow(ResultSet rs, int rowNum) throws SQLException {
		ReservationCancelDto reservationCancelDto = new ReservationCancelDto();

		return reservationCancelDto;
	}
}
