package com.kh.baseball.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.kh.baseball.dto.SeatDto;
import com.kh.baseball.mapper.SeatMapper;

@Repository
public class SeatDaoImpl implements SeatDao{
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	@Autowired
	private SeatMapper seatMapper;

	@Override
	public void insert(SeatDto seatDto) {
		
		String sql = "insert into seat(seat_Id,seat_area_no,seat_row,seat_col,seat_status) values(?,?,?,?,?)";
		Object[] data = {seatDto.getSeatId(),
				seatDto.getSeatAreaNo(),
				seatDto.getSeatRow(),
				seatDto.getSeatCol(),
				seatDto.getSeatStatus()};
		
		jdbcTemplate.update(sql, data);
		
	}

	@Override
	public int sequence() {
		String sql = "select seat_seq.nextval from dual";
		return jdbcTemplate.queryForObject(sql, int.class);
	}

	@Override
	public int findSeatAreaNo(int seatAreaNo) {
		String sql = "select seat_area_no from seat_area where seat_area_no=?";
		
		return 0;
	}

	@Override
	public SeatDto selectOne(int seatId) {
		String sql = "select * from seat where seat_id=?";
		Object[] data = {seatId};
		List<SeatDto> list = jdbcTemplate.query(sql, seatMapper, data);
		
		return list.isEmpty() ? null: list.get(0) ;
	}

	@Override
	public List<SeatDto> selectList() {
		String sql = "select * from seat";
		return jdbcTemplate.query(sql , seatMapper);
	}
	@Override
	public boolean delete(int seatId) {
		String sql = "delete seat where seat_id=?";
		Object[] data = {seatId};
		return jdbcTemplate.update(sql,data)>0;
	}
	
	


	}
	
	


