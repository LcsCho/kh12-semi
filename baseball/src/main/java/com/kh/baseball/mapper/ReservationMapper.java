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
		reservationDto.setHomeTeam(rs.getString("home_team"));
		reservationDto.setAwayTeam(rs.getString("away_team"));
		reservationDto.setMemberId(rs.getString("member_id"));
		reservationDto.setStadiumName(rs.getString("stadium_name"));
		reservationDto.setReservationDate(rs.getDate("reservation_date"));
		reservationDto.setSeatAreaPrice(rs.getInt("seat_area_price"));
		reservationDto.setStadiumNo(rs.getInt("stadium_no"));
		reservationDto.setSeatAreaZone(rs.getString("seat_area_zone"));
		reservationDto.setSeatRow(rs.getInt("seat_row"));
		reservationDto.setSeatCol(rs.getInt("seat_col"));
		return reservationDto;
	}
}
