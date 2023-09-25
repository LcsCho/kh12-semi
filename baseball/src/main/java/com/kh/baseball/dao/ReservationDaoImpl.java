package com.kh.baseball.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.kh.baseball.dto.ReservationCancelDto;
import com.kh.baseball.dto.ReservationDto;
import com.kh.baseball.mapper.ReservationCancelMapper;
import com.kh.baseball.mapper.ReservationMapper;

@Repository
public class ReservationDaoImpl implements ReservationDao{
 
	 @Autowired
	private JdbcTemplate jdbcTemplate;
	 
	 @Autowired
	 private ReservationMapper reservationMapper;
	 
	 @Autowired
	 private ReservationCancelMapper reservationCancelMapper;
	
	//등록
	@Override
	public void insert(ReservationDto reservationDto) {
		String sql = "insert into reservation(reservation_no, match_no, seat_no, home_team, "
				+ "away_team, member_id, stadium_name, reservation_date, "
				+ "seat_area_price, stadium_no, seat_area_zone, seat_row, seat_col, seat_area_no) "
				+ "values(reservation_seq.nextval, ?, ?, ?, ?, ?, ?, ?, ?)";
		Object[] data = {
				reservationDto.getMatchNo(), 
				reservationDto.getSeatNo(), 
				reservationDto.getHomeTeam(), 
				reservationDto.getAwayTeam(), 
				reservationDto.getMemberId(), 
				reservationDto.getReservationDate(),
				reservationDto.getStadiumName(),
				reservationDto.getReservationDate(),
				reservationDto.getSeatAreaPrice(),
				reservationDto.getStadiumNo(),
				reservationDto.getSeatAreaZone(),
				reservationDto.getSeatRow(),
				reservationDto.getSeatCol()
		};
		jdbcTemplate.update(sql, data);
	}
	 
	 
	//회원별 목록 조회
	 @Override
	public List<ReservationDto> selectList(String memberId) {

	       String sql = "SELECT rs.reservation_no, " +
	                "ma.match_no, " +
	                "s.seat_no, " +
	                "hm.TEAM_name as HOME_TEAM, " +
	                "aw.team_name as AWAY_TEAM, " +
	                "m.member_id, " +
	                "ma.stadium_name, " +
	                "rs.RESERVATION_DATE, " +
	                "s.seat_area_no, " +
	                "sa.seat_area_price, " +
	                "sa.stadium_no, " +
	                "sa.seat_area_zone, " +
	                "s.seat_row, " +
	                "s.seat_col,"
	                + "ma.match_date  " +
	                "FROM reservation rs " +
	                "INNER JOIN seat s ON rs.seat_no = s.seat_no " +
	                "INNER JOIN match ma ON rs.match_no = ma.match_no " +
	                "INNER JOIN member m ON rs.member_id = m.member_id " +
	                "INNER JOIN team hm ON rs.home_team = hm.team_no " +
	                "INNER JOIN team aw ON rs.away_team = aw.team_no " +
	                "INNER JOIN seat_area sa ON rs.seat_area_no = sa.SEAT_AREA_NO " +
	                "WHERE m.member_id = ?";
		Object[] data = {memberId};
		return jdbcTemplate.query(sql, reservationMapper, data);
	}
	
	 //수정
	 @Override
	public boolean update(ReservationDto reservationDto) {
		 String sql = "update reservation set match_no=?, seat_no=?, home_team=?, "
		 		+ "member_id=?, away_team=?, reservation_date=? "
		 		+ "where reservation_no=?";
		 Object[] data = { reservationDto.getMatchNo(), 
								reservationDto.getSeatNo(), 
								reservationDto.getHomeTeam(),
								reservationDto.getMemberId(), 
								reservationDto.getAwayTeam(), 
								reservationDto.getReservationDate(), 
								reservationDto.getReservationNo()
		 		};
		return jdbcTemplate.update(sql, data) > 0;
	}
	 
	 //삭제
	@Override
	public boolean cancel(int reservationNo) {
		String sql = "delete reservation_vo where reservation_no = ?";
		Object[] data = {reservationNo};
		return jdbcTemplate.update(sql, data) > 0;
	}
	
	@Override
	public List<ReservationCancelDto> cancelList(String memberId) {
		String sql = "select * from reservation_cancel where member_id = ?";
		Object[] data = {memberId};
		return jdbcTemplate.query(sql, reservationCancelMapper);
	}


	@Override
	public ReservationDto selectOne(int reservationNo) {
		String sql = "select * from reservation_vo where reservation_no = ?";
		Object[] data = {reservationNo};
		List<ReservationDto> list = jdbcTemplate.query(sql, reservationMapper, data);
		return list.isEmpty() ? null : list.get(0);
	}
}
