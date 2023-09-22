package com.kh.baseball.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.kh.baseball.dto.SeatDto;
import com.kh.baseball.dto.SeatListDto;
import com.kh.baseball.mapper.SeatListMapper;
import com.kh.baseball.mapper.SeatMapper;

@Repository
public class SeatDaoImpl implements SeatDao {

	@Autowired
	private JdbcTemplate jdbcTemplate;

	@Autowired
	private SeatMapper seatMapper;

	@Override
	public void insert(SeatDto seatDto) {
		// 2중 for문으로 행열의 곱으로 좌석을 생성한다
		String sql = "insert into seat(seat_no, seat_area_no, " + "seat_row, seat_col, seat_status) "
				+ "values(?, ?, ?, ?, ?)";
		Object[] data = { seatDto.getSeatNo(), seatDto.getSeatAreaNo(), seatDto.getSeatRow(), seatDto.getSeatCol(),
				seatDto.getSeatStatus() };

		jdbcTemplate.update(sql, data);
	}

//	for(int i=0;i<3;i++){
//		for(int j=0;j<4;j++){
//			System.out.print("*");
//		}
//		System.out.println("");
//	}

	@Override
	public int sequenceSeat() {
		String sql = "select seat_no_seq.nextval from dual";
		return jdbcTemplate.queryForObject(sql, int.class);
	}

	@Override
	public SeatDto selectOne(int seatNo) {
		String sql = "select * from seat where seat_no=?";
		Object[] data = { seatNo };
		List<SeatDto> list = jdbcTemplate.query(sql, seatMapper, data);

		return list.isEmpty() ? null : list.get(0);
	}

	@Override
	public List<SeatDto> selectList() {
		String sql = "select * from seat";
		return jdbcTemplate.query(sql, seatMapper);
	}

	@Override
	public boolean delete(int seatNo) {
		String sql = "delete seat where seat_no=?";
		Object[] data = { seatNo };
		return jdbcTemplate.update(sql, data) > 0;
	}

	@Override
	public void insertSeats(SeatDto seatDto) {
		String sql = "INSERT INTO seat(seat_no,seat_area_no, seat_row, seat_col, seat_status) VALUES (seat_no_seq.nextval,?, ?, ?, ?)";
		for (int row = 1; row <= seatDto.getSeatRow(); row++) {
			for (int col = 1; col <= seatDto.getSeatCol(); col++) {
				jdbcTemplate.update(sql, seatDto.getSeatAreaNo(), row, col, seatDto.getSeatStatus());
			}
		}
	}
	@Autowired
	private SeatListMapper seatListMapper;
	
	@Override
	public List<SeatListDto> seatSeletList() {
		// 좌석상태와 경기장이름 좌석구역을 확인 할 수 있는 리스트 출력
		String sql = "SELECT "
		        + "s.seat_no, "
		        + "sa.seat_area_no, "
		        + "st.stadium_name, "
		        + "sa.seat_area_price,"
		        + "sa.seat_area_zone, " 
		        + "s.seat_col, "
		        + "s.seat_row, "
		        + "s.seat_status, "
		        + "st.stadium_no " 
		        + "FROM "
		        + "seat s "
		        + "INNER JOIN "
		        + "seat_area sa ON s.seat_area_no = sa.seat_area_no "
		        + "INNER JOIN "
		        + "stadium st ON sa.stadium_no = st.stadium_no";
				
		return jdbcTemplate.query(sql,seatListMapper);	
		}

}
