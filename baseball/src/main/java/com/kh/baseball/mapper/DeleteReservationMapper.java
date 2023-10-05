package com.kh.baseball.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Arrays;

import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Component;

import com.kh.baseball.dto.DeleteReservationDto;

@Component
public class DeleteReservationMapper implements RowMapper<DeleteReservationDto> {

	@Override
	public DeleteReservationDto mapRow(ResultSet rs, int rowNum) throws SQLException {
		DeleteReservationDto deleteReservationDto = new DeleteReservationDto();
		deleteReservationDto.setSeatNo(rs.getInt("seat_no"));
		String reservationNoString = rs.getString("reservation_no");
		if (reservationNoString != null) {
			String[] reservationNoArray = reservationNoString.split(",");
			int[] reservationNos = Arrays.stream(reservationNoArray).mapToInt(Integer::parseInt).toArray();
			deleteReservationDto.setReservationNo(reservationNos);
		} else {
			deleteReservationDto.setReservationNo(null); // 예외 처리: seat_no가 null인 경우
		}
		deleteReservationDto.setHomeTeam(rs.getInt("home_team"));
		deleteReservationDto.setAwayTeam(rs.getInt("away_team"));
		deleteReservationDto.setMemberId(rs.getString("member_id"));
		deleteReservationDto.setSeatAreaNo(rs.getInt("seat_area_no"));
		deleteReservationDto.setReservationDate(rs.getDate("reservation_date"));
		deleteReservationDto.setReservationTicket(rs.getInt("reservation_ticket"));
		deleteReservationDto.setMatchNo(rs.getInt("match_no"));

		return deleteReservationDto;
	}

}
