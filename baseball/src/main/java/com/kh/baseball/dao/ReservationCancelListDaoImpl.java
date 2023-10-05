package com.kh.baseball.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.batch.BatchProperties.Jdbc;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.kh.baseball.dto.ReservationCancelDto;
import com.kh.baseball.mapper.ReservationCancleListMapper;
import com.kh.baseball.vo.PaginationVO;
import com.kh.baseball.vo.ReservationVO;

@Repository
public class ReservationCancelListDaoImpl implements ReservationCancelListDao{
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	@Autowired
	private ReservationCancleListMapper reservationCancleListMapper;
	
//	@Override
//	public List<ReservationVO> reservationCancelListByMember(String memberId) {
//		String sql = "SELECT " +
//	             "rc.RESERVATION_CANCEL_NO, " +
//	             "ma.home_team, " +
//	             "ma.away_team, " +
//	             "ma.stadium_name, " +
//	             "rc.RESERVATION_CANCEL_TIME, " +
//	             "s.SEAT_NO, " +
//	             "s.seat_col, " +
//	             "s.seat_row, " +
//	             "sa.seat_area_zone " +
//	             "FROM reservation_cancel rc " +
//	             "INNER JOIN match ma ON rc.match_no = ma.MATCH_NO " +
//	             "INNER JOIN seat s ON s.SEAT_NO = rc.SEAT_NO " +
//	             "INNER JOIN seat_area sa ON sa.SEAT_AREA_NO = s.SEAT_AREA_NO " +
//	             "WHERE MEMBER_ID = ?";
//		return jdbcTemplate.query(sql ,reservationCancleListMapper, memberId);
//	}
	@Override
	public List<ReservationVO> reservationCancelListByMember(PaginationVO vo,String memberId) {
		String sql = "select * from ("
				+ "select rownum rn, TMP.* from ("
				+ "SELECT "
				+ "rc.RESERVATION_CANCEL_NO, "
				+ "ma.home_team, "
				+ "ma.away_team, "
				+ "ma.stadium_name, "
				+ "rc.RESERVATION_CANCEL_TIME, "
				+ "s.SEAT_NO, "
				+ "s.seat_col, "
				+ "s.seat_row, "
				+ "sa.seat_area_zone "
				+ "FROM "
				+ "reservation_cancel rc "
				+ "INNER JOIN "
				+ "match ma ON rc.match_no = ma.MATCH_NO "
				+ "INNER JOIN "
				+ "seat s ON s.SEAT_NO = rc.SEAT_NO "
				+ "INNER JOIN "
				+ "seat_area sa ON sa.SEAT_AREA_NO = s.SEAT_AREA_NO "
				+ "WHERE "
				+ "MEMBER_ID = ? "
				+ "order by reservation_cancel_no desc"
			+ ")TMP"
		+ ") where rn between ? and ?";
		return jdbcTemplate.query(sql ,reservationCancleListMapper, memberId, vo.getStartRow(), vo.getFinishRow());
	}


	@Override
	public int countList(PaginationVO vo, String memberId) {
		String sql = "select count(*) from reservation_cancel where member_id=?";
		return jdbcTemplate.queryForObject(sql, int.class,memberId);
	}
	
	@Override
	public void reservationCancelInsertBySeatNo(ReservationCancelDto reservationCancelDto) {
		String sql = "INSERT INTO reservation_cancel " +
	             "(reservation_cancel_no, reservation_no, match_no, reservation_cancel_time, seat_no, member_id) " +
	             "VALUES " +
	             "(reservation_cancel_seq.nextval, " +
	             "?, " +
	             "(SELECT match_no FROM reservation WHERE reservation_no = ?), " +
	             "SYSDATE, " +
	             "(SELECT seat_no FROM reservation WHERE reservation_no = ?), " +
	             "?)";

	    int[] reservationNos = reservationCancelDto.getReservationNo();
	    String memberId = reservationCancelDto.getMemberId();
	    
	    for (int i = 0; i < reservationNos.length; i++) {
	        Object[] data = {reservationNos[i],reservationNos[i],reservationNos[i],memberId};
	        jdbcTemplate.update(sql, data);
	    }
	}
	

}
