package com.kh.baseball.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Arrays;

import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Component;

import com.kh.baseball.vo.AdminReservationListVO;
import com.kh.baseball.vo.ReservationVO;

@Component
public class ReservationListByAdminMApper implements RowMapper<AdminReservationListVO>{

	@Override
	public AdminReservationListVO mapRow(ResultSet rs, int rowNum) throws SQLException {
		AdminReservationListVO adminReservationListVO = new AdminReservationListVO();
		adminReservationListVO.setHomeTeam(rs.getString("HOME_TEAM"));
		adminReservationListVO.setAwayTeam(rs.getString("AWAY_TEAM"));
		adminReservationListVO.setSeatAreaZone(rs.getString("seat_area_zone"));
		adminReservationListVO.setSeatRow(rs.getInt("SEAT_ROW"));
		adminReservationListVO.setSeatCol(rs.getInt("SEAT_COL"));
		adminReservationListVO.setMemberId(rs.getString("member_id"));
		adminReservationListVO.setReservationDate(rs.getDate("RESERVATION_DATE"));
		adminReservationListVO.setReservationNo(rs.getInt("RESERVATION_NO"));
		adminReservationListVO.setStadiumName(rs.getString("STADIUM_NAME"));
		adminReservationListVO.setSeatAreaPrice(rs.getInt("SEAT_AREA_PRICE"));
		 String seatNoString = rs.getString("seat_no");
	        if (seatNoString != null) {
	            String[] seatNoArray = seatNoString.split(",");
	            int[] seatNoInts = Arrays.stream(seatNoArray)
	                    .mapToInt(Integer::parseInt)
	                    .toArray();
	            adminReservationListVO.setSeatNo(seatNoInts);
	        } else {
	        	adminReservationListVO.setSeatNo(null); // 예외 처리: seat_no가 null인 경우
	        }
	        
		
		return adminReservationListVO;
	}
	

}
