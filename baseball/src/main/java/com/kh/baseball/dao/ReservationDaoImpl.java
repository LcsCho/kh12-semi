package com.kh.baseball.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.kh.baseball.dto.ReservationDto;
import com.kh.baseball.mapper.ReservationMapper;

@Repository
public class ReservationDaoImpl implements ReservationDao{
 
	 @Autowired
	private JdbcTemplate jdbcTemplate;
	 
	 @Autowired
	 private ReservationMapper reservationMapper;
	 
	@Override
	public int sequence() {
		String sql = "select reservation_seq.nextval from dual";
		return jdbcTemplate.queryForObject(sql, int.class);
	}
	
	//등록
	 @Override
	public void insert(ReservationDto reservationDto) {
		String sql = "insert into reservation(reservation_no, match_no, seat_no, team_home, "
				+ "seat_area_no, member_id, team_away, reservation_date, sear_area_price) "
				+ "values(?,?,?,?,?,?,?,?,?)";
		Object[] data = {reservationDto.getReservationNo(), 
								reservationDto.getMatchNo(), 
								reservationDto.getSeatNo(), 
								reservationDto.getTeamHome(), 
								reservationDto.getSeatAreaNo(), 
								reservationDto.getMemberId(), 
								reservationDto.getTeamAway(), 
								reservationDto.getReservationDate(), 
								reservationDto.getSeatAreaPrice()
				};
		jdbcTemplate.update(sql, data);
	}
	 
	//조회 
	@Override
	public List<ReservationDto> selectList() {
		String sql = "select * from reservation order by reservation_no desc";
		return jdbcTemplate.query(sql, reservationMapper);
	} 
	 
	//상세조회
	 @Override
	public ReservationDto selectOne(int reservationNo) {
		String sql = "select * from reservation where reservation_no=?";
		Object[] data = {reservationNo};
		List<ReservationDto> list = jdbcTemplate.query(sql, reservationMapper, data);
		return list.isEmpty() ? null : list.get(0);
	}
	
	 //수정
	 @Override
	public boolean update(ReservationDto reservationDto) {
		 String sql = "update reservation set match_no=?, seat_no=?, team_home=?, "
		 		+ "seat_area_no=?, member_id=?, team_away=?, reservation_date=?, sear_area_price=? "
		 		+ "where reservation_no=?";
		 Object[] data = { reservationDto.getMatchNo(), 
								reservationDto.getSeatNo(), 
								reservationDto.getTeamHome(),
								reservationDto.getSeatAreaNo(),
								reservationDto.getMemberId(), 
								reservationDto.getTeamAway(), 
								reservationDto.getReservationDate(), 
								reservationDto.getSeatAreaPrice(),
								reservationDto.getReservationNo()
		 		};
		return jdbcTemplate.update(sql, data) > 0;
	}
	 
	 //삭제
	 @Override
	public boolean delete(int reservationNo) {
		String sql = "delete reservation where reservation_no=?";
		Object[] data = {reservationNo};
		return jdbcTemplate.update(sql, data) > 0;
	}
}
