package com.kh.baseball.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Arrays;

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
		// seatNo를 콤마로 구분된 문자열로부터 배열로 변환
        String seatNoString = rs.getString("seat_no");
        if (seatNoString != null) {
            String[] seatNoArray = seatNoString.split(",");
            int[] seatNoInts = Arrays.stream(seatNoArray)
                    .mapToInt(Integer::parseInt)
                    .toArray();
            trueReservationDto.setSeatNo(seatNoInts);
        } else {
            trueReservationDto.setSeatNo(null); // 예외 처리: seat_no가 null인 경우
        }
		trueReservationDto.setHomeTeam(rs.getInt("home_team"));
		trueReservationDto.setAwayTeam(rs.getInt("away_team"));
		trueReservationDto.setMemberId(rs.getString("member_id"));
		trueReservationDto.setSeatAreaNo(rs.getInt("seat_area_no"));
		trueReservationDto.setReservationDate(rs.getDate("reservation_date"));
		trueReservationDto.setReservationTicket(rs.getInt("reservation_ticket"));
		return trueReservationDto;
	}

	
}
