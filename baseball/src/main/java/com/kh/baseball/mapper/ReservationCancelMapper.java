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
		reservationCancelDto.setReservationNo(rs.getInt("reservation_no"));
		 String seatNoString = rs.getString("seat_no");
	        if (seatNoString != null) {
	            String[] seatNoArray = seatNoString.split(",");
	            int[] seatNoInts = Arrays.stream(seatNoArray)
	                    .mapToInt(Integer::parseInt)
	                    .toArray();
	            reservationCancelDto.setSeatNo(seatNoInts);
	        } else {
	        	reservationCancelDto.setSeatNo(null); // 예외 처리: seat_no가 null인 경우
	        }
		return reservationCancelDto;
	}
}
