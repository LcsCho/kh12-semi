package com.kh.baseball.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Component;

import com.kh.baseball.vo.ReservationVO;

@Component
public class MatchInfoMapper implements RowMapper<ReservationVO>{

	@Override
	public ReservationVO mapRow(ResultSet rs, int rowNum) throws SQLException {
		ReservationVO reservationVO = new ReservationVO();
		reservationVO.setMatchNo(rs.getInt("match_no"));
		reservationVO.setHomeTeam(rs.getString("home_team"));
		reservationVO.setAwayTeam(rs.getString("away_team"));
		reservationVO.setStadiumName(rs.getString("stadium_name"));
		reservationVO.setSeatAreaNo(rs.getInt("seat_area_no"));
		reservationVO.setSeatAreaPrice(rs.getInt("seat_area_price"));
		reservationVO.setStadiumNo(rs.getInt("stadium_no"));
		reservationVO.setSeatAreaZone(rs.getString("seat_area_zone"));
		reservationVO.setMatchDate(rs.getDate("match_date"));
		return reservationVO;
	}

}
