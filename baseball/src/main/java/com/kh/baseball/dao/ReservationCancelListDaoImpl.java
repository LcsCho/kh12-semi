package com.kh.baseball.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.batch.BatchProperties.Jdbc;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.kh.baseball.mapper.ReservationCancleListMapper;
import com.kh.baseball.vo.ReservationVO;

@Repository
public class ReservationCancelListDaoImpl implements ReservationCancelListDao{
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	@Autowired
	private ReservationCancleListMapper reservationCancleListMapper;
	
	@Override
	public List<ReservationVO> reservationCancelListByMember(String memberId) {
		String sql = "SELECT " +
	             "rc.RESERVATION_CANCEL_NO, " +
	             "ma.home_team, " +
	             "ma.away_team, " +
	             "ma.stadium_name, " +
	             "rc.RESERVATION_CANCEL_TIME, " +
	             "s.SEAT_NO, " +
	             "s.seat_col, " +
	             "s.seat_row, " +
	             "sa.seat_area_zone " +
	             "FROM reservation_cancel rc " +
	             "INNER JOIN match ma ON rc.match_no = ma.MATCH_NO " +
	             "INNER JOIN seat s ON s.SEAT_NO = rc.SEAT_NO " +
	             "INNER JOIN seat_area sa ON sa.SEAT_AREA_NO = s.SEAT_AREA_NO " +
	             "WHERE MEMBER_ID = ?";
		return jdbcTemplate.query(sql ,reservationCancleListMapper, memberId);
	}

}
