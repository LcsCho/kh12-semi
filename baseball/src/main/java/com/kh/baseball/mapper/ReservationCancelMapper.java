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
		reservationCancelDto.setReservationNo(rs.getInt("reservation_no"));
		reservationCancelDto.setMatchNo(rs.getInt("match_no"));
		reservationCancelDto.setSeatNo(rs.getInt("seat_no"));
		reservationCancelDto.setHomeTeam(rs.getString("home_team"));
		reservationCancelDto.setAwayTeam(rs.getString("away_team"));
		reservationCancelDto.setMemberId(rs.getString("member_id"));
		reservationCancelDto.setStadiumName(rs.getString("stadium_name"));
		reservationCancelDto.setReservationDate(rs.getDate("reservation_date"));
		reservationCancelDto.setSeatAreaPrice(rs.getInt("seat_area_price"));
		reservationCancelDto.setStadiumNo(rs.getInt("stadium_no"));
		reservationCancelDto.setSeatAreaZone(rs.getString("seat_area_zone"));
		reservationCancelDto.setSeatRow(rs.getInt("seat_row"));
		reservationCancelDto.setSeatCol(rs.getInt("seat_col"));
		reservationCancelDto.setSeatAreaNo(rs.getInt("seat_area_no"));
		reservationCancelDto.setMatchDate(rs.getDate("match_date"));
		return reservationCancelDto;
	}
}
