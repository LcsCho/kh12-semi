package com.kh.baseball.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Component;

import com.kh.baseball.dto.TrueReservationDto;

@Component
public class TrueReservationMapper implements RowMapper<TrueReservationDto>{

	@Override
	public TrueReservationDto mapRow(ResultSet rs, int rowNum) throws SQLException {
		TrueReservationDto trueReservationDto = new TrueReservationDto();
		trueReservationDto.setReservationNo(rs.getInt("reservation_no"));
		trueReservationDto.setMatchNo(rs.getInt("match_no"));
		trueReservationDto.setSeatNo(rs.getInt("seat_no"));
		trueReservationDto.setHomeTeam(rs.getInt("home_team"));
		trueReservationDto.setAwayTeam(rs.getInt("away_team"));
		trueReservationDto.setMemberId(rs.getString("member_id"));
		trueReservationDto.setSeatAreaNo(rs.getInt("seat_area_no"));
		trueReservationDto.setReservationDate(rs.getDate("reservation_date"));
		trueReservationDto.setReservationTicket(rs.getInt("reservation_ticket"));
		return trueReservationDto;
	}

}
