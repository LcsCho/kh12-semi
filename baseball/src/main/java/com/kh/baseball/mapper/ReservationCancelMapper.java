package com.kh.baseball.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Arrays;

import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Component;

import com.kh.baseball.dto.ReservationCancelDto;

@Component
public class ReservationCancelMapper implements RowMapper<ReservationCancelDto>{

	@Override
	public ReservationCancelDto mapRow(ResultSet rs, int rowNum) throws SQLException {
		ReservationCancelDto reservationCancelDto = new ReservationCancelDto();
		reservationCancelDto.setReservationCancelNo(rs.getInt("reservation_cancel_no"));
		reservationCancelDto.setReservationCancelDate(rs.getDate("reservation_cancel_time"));
		reservationCancelDto.setSeatNo(rs.getInt("seat_no"));
		 String reservationNoString = rs.getString("reservation_no");
	        if (reservationNoString != null) {
	            String[] reservationNoArray = reservationNoString.split(",");
	            int[] reservationNos = Arrays.stream(reservationNoArray)
	                    .mapToInt(Integer::parseInt)
	                    .toArray();
	            reservationCancelDto.setReservationNo(reservationNos);
	        } else {
	        	reservationCancelDto.setReservationNo(null); // 예외 처리: seat_no가 null인 경우
	        }
	     reservationCancelDto.setMatchNo(rs.getInt("match_no"));
		return reservationCancelDto;
	}
}
