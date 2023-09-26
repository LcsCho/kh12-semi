package com.kh.baseball.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Component;

import com.kh.baseball.vo.ReservationVO;

@Component
public class ReservationVoMapper implements RowMapper<ReservationVO>{

	@Override
	public ReservationVO mapRow(ResultSet rs, int rowNum) throws SQLException {
		 ReservationVO reservationVO = new ReservationVO();
		reservationVO.setReservationNo(rs.getInt("reservation_no"));
        reservationVO.setMatchNo(rs.getInt("match_no"));
        reservationVO.setSeatNo(rs.getInt("seat_no"));
        reservationVO.setHomeTeam(rs.getString("home_team"));
        reservationVO.setAwayTeam(rs.getString("away_team"));
        reservationVO.setMemberId(rs.getString("member_id"));
        reservationVO.setStadiumName(rs.getString("stadium_name"));
        reservationVO.setReservationDate(rs.getDate("reservation_date"));
        reservationVO.setSeatAreaNo(rs.getInt("seat_area_no"));
        reservationVO.setSeatAreaPrice(rs.getInt("seat_area_price"));
        reservationVO.setStadiumNo(rs.getInt("stadium_no"));
        reservationVO.setSeatAreaZone(rs.getString("seat_area_zone"));
        reservationVO.setSeatRow(rs.getInt("seat_row"));
        reservationVO.setSeatCol(rs.getInt("seat_col"));
        reservationVO.setMatchDate(rs.getDate("match_date"));
        reservationVO.setReservationTicket(rs.getInt("reservation_ticket"));
        return reservationVO;
	}

}
