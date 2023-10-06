package com.kh.baseball.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Component;

import com.kh.baseball.dto.SeatListDto;
import com.kh.baseball.vo.SeatListVO;
@Component
public class SeatListVoMapper implements RowMapper<SeatListVO>{

	@Override
	public SeatListVO mapRow(ResultSet rs, int rowNum) throws SQLException {
		SeatListVO seatListVO = new SeatListVO();
		seatListVO.setSeatNo(rs.getInt("seat_no"));
		seatListVO.setSeatAreaPrice(rs.getInt("seat_area_price"));
		seatListVO.setSeatAreaNo(rs.getInt("seat_area_no"));
		seatListVO.setSeatRow(rs.getInt("seat_row"));
		seatListVO.setSeatCol(rs.getInt("seat_col"));
		seatListVO.setStadiumNo(rs.getInt("stadium_no"));
		seatListVO.setSeatAreaZone(rs.getString("seat_area_zone"));
		seatListVO.setStadiumName(rs.getString("stadium_name"));
		seatListVO.setReservationNo(rs.getInt("reservation_no"));
		seatListVO.setSeatStatus(rs.getString("seat_status"));

		return seatListVO;
	}

}
