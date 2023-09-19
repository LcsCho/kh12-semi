package com.kh.baseball.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Component;

import com.kh.baseball.dto.ReservationDto;

@Component
public class ReservationMapper implements RowMapper<ReservationDto>{

	@Override
	public ReservationDto mapRow(ResultSet rs, int rowNum) throws SQLException {
		ReservationDto reservationDto = new ReservationDto();
		reservationDto.setReservationNo(rs.getInt("reservation_no"));
		reservationDto.setMatchNo(rs.getInt("match_no"));
		reservationDto.setSeatNo(rs.getInt("seat_no"));
		reservationDto.setTeamHome(rs.getString("team_home"));
		reservationDto.setSeatAreaNo(rs.getInt("seat_area_no"));
		reservationDto.setMemberId(rs.getString("member_id"));
		reservationDto.setTeamAway(rs.getString("team_away"));
		reservationDto.setReservationDate(rs.getDate("reservation_date"));
		reservationDto.setSeatAreaPrice(rs.getInt("seat_area_price"));
		return reservationDto;
	}
}
