package com.kh.baseball.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Arrays;

import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Component;

import com.kh.baseball.vo.SeatUpdateVo;

@Component
public class UpdateMapper implements RowMapper<SeatUpdateVo>{

	@Override
	public SeatUpdateVo mapRow(ResultSet rs, int rowNum) throws SQLException {
		SeatUpdateVo seatUpdateVo = new SeatUpdateVo();
		String seatNoString = rs.getString("seat_no");
        if (seatNoString != null) {
            String[] seatNoArray = seatNoString.split(",");
            int[] seatNoInts = Arrays.stream(seatNoArray)
                    .mapToInt(Integer::parseInt)
                    .toArray();
            seatUpdateVo.setSeatNo(seatNoInts);
        } else {
        	seatUpdateVo.setSeatNo(null); // 예외 처리: seat_no가 null인 경우
        }
        seatUpdateVo.setSeatAreaPrice(rs.getInt("seat_area_price"));
        seatUpdateVo.setSeatStatus(rs.getString("seat_status"));
        return null;
	}

}
