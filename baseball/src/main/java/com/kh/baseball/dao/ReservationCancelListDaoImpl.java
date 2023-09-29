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
		 String sql = "select " +
                 "m.home_team, " +
                 "m.away_team, " +
                 "m.stadium_name, " +
                 "rc.reservation_cancel_no, " +
                 "rc.reservation_cancel_time, " +
                 "rc.seat_no, " +
                 "s.seat_col, " +
                 "s.seat_row, " +
                 "sa.seat_area_zone " +
                 "from " +
                 "reservation_cancel rc " +
                 "inner join reservation r on rc.seat_no = r.seat_no " +
                 "inner join seat s on rc.seat_no = s.seat_no " +
                 "inner join seat_area sa on s.seat_area_no = sa.seat_area_no " +
                 "inner join member mb on r.member_id = mb.member_id " +
                 "inner join match m on r.match_no = m.match_no " +
                 "where mb.member_id = ?";
		return jdbcTemplate.query(sql ,reservationCancleListMapper, memberId);
	}

}
