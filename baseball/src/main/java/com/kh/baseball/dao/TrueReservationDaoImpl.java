package com.kh.baseball.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.kh.baseball.dto.TrueReservationDto;
import com.kh.baseball.mapper.TrueReservationMapper;

@Repository
public class TrueReservationDaoImpl implements TrueReservationDao{
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	@Autowired
	private TrueReservationMapper trueReservationMapper;

	@Override
	public int sequence() {
		String sql = "select reservation_seq.nextval from dual";
		return jdbcTemplate.queryForObject(sql, int.class);
	}
	
	@Override
	public void insert(TrueReservationDto trueReservationDto) {
		String sql = "INSERT INTO reservation (reservation_no, match_no, seat_no, home_team, away_team, member_id, seat_area_no, reservation_date, reservation_ticket) " +
	             "VALUES (?, ?, ?, " +
	             "(SELECT team_no FROM team WHERE team_name = (SELECT home_team FROM match WHERE match_no = ?)), " +
	             "(SELECT team_no FROM team WHERE team_name = (SELECT away_team FROM match WHERE match_no = ?)), " +
	             "?, ?, sysdate, ?)";
		
		Object[] data = {
				trueReservationDto.getReservationNo(), trueReservationDto.getMatchNo(), trueReservationDto.getSeatNo(),
				trueReservationDto.getMatchNo(), trueReservationDto.getMatchNo(), trueReservationDto.getMemberId(),
				trueReservationDto.getSeatAreaNo(), trueReservationDto.getReservationTicket()
		};
		jdbcTemplate.update(sql, data);
	}

}
