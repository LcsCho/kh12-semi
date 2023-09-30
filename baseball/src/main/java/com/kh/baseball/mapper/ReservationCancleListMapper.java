package com.kh.baseball.mapper;


import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Component;

import com.kh.baseball.vo.ReservationVO;

@Component
public class ReservationCancleListMapper implements RowMapper<ReservationVO>{

	@Override
	public ReservationVO mapRow(ResultSet rs, int rowNum) throws SQLException {
		ReservationVO reservationCancelVO = new ReservationVO();
		reservationCancelVO.setHomeTeam(rs.getString("home_team"));
		reservationCancelVO.setAwayTeam(rs.getString("away_team"));
		reservationCancelVO.setStadiumName(rs.getString("stadium_name"));
		reservationCancelVO.setReservationCancelNo(rs.getInt("reservation_cancel_no"));
		reservationCancelVO.setReservationCancelDate(rs.getDate("reservation_cancel_time"));
		reservationCancelVO.setSeatAreaZone(rs.getString("seat_area_zone"));
		reservationCancelVO.setSeatCol(rs.getInt("seat_col"));
		reservationCancelVO.setSeatRow(rs.getInt("seat_row"));
		reservationCancelVO.setSeatNo(rs.getInt("seat_no"));

		return reservationCancelVO;
	}
	
}
