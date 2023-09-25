package com.kh.baseball.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.kh.baseball.dto.FindStadiumNameDto;
import com.kh.baseball.dto.SeatAreaDto;
import com.kh.baseball.mapper.FindStadiumNameMapper;
import com.kh.baseball.mapper.SeatAreaMapper;

@Repository
public class SeatAreaDaoImpl implements SeatAreaDao{
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	@Autowired
	private SeatAreaMapper seatAreaMapper;
	@Autowired
	private FindStadiumNameMapper nameMapper;
	
	@Override
	public int sequenceSeatArea() {
		String sql = "select seat_area_seq.nextval from dual";
		return jdbcTemplate.queryForObject(sql, int.class);
	}
	
	@Override
	public void insert(SeatAreaDto seatAreaDto) {

		String sql = "insert into seat_area(seat_area_no, stadium_no, seat_area_zone, seat_area_price) "
				+ "values(?, ?, ?, ?)";
		Object[] data = {seatAreaDto.getSeatAreaNo() ,seatAreaDto.getStadiumNo(), seatAreaDto.getSeatAreaZone(), seatAreaDto.getSeatAreaPrice()};


		jdbcTemplate.update(sql, data);
	}

	@Override
	public SeatAreaDto selectOne(int seatAreaNo) {
		String sql = "select * from seat_area where seat_area_no = ?";
		Object[] data = {seatAreaNo};
		List<SeatAreaDto> list = jdbcTemplate.query(sql, seatAreaMapper, data);
		return list.isEmpty() ? null : list.get(0);
	}

	@Override
	public List<SeatAreaDto> selectList() {
		String sql = "select * from seat_area order by seat_area_no desc";
		return jdbcTemplate.query(sql, seatAreaMapper);
	}

	@Override
	public boolean update(SeatAreaDto seatAreaDto) {
		String sql = "update seat_area set "
				+ "stadium_no = ?, seat_area_zone = ?, seat_area_price = ? "
				+ "where seat_area_no = ?";
		Object[] data = {
				seatAreaDto.getStadiumNo(), seatAreaDto.getSeatAreaZone(),
				seatAreaDto.getSeatAreaPrice(), seatAreaDto.getSeatAreaNo()
		};
		return jdbcTemplate.update(sql, data) > 0;
	}

	@Override
	public boolean delete(int seatAreaNo) {
		String sql = "delete from seat_area where seat_area_no = ?";
		Object[] data = {seatAreaNo};
		return jdbcTemplate.update(sql, data) > 0;
	}
	
	@Override
	public List<FindStadiumNameDto> selectStadiumName() {
		String sql = "SELECT st.stadium_no, sa.SEAT_AREA_NO, sa.seat_area_zone, st.stadium_name, sa.seat_area_price, " +
	             "COALESCE(COUNT(s.seat_no), 0) AS seat_count " +
	             "FROM stadium st " +
	             "LEFT OUTER JOIN seat_area sa ON st.stadium_no = sa.stadium_no " +
	             "LEFT OUTER JOIN seat s ON sa.seat_area_no = s.seat_area_no " +
	             "GROUP BY st.stadium_no, sa.SEAT_AREA_NO, sa.seat_area_zone, st.stadium_name, sa.seat_area_price " +
	             "ORDER BY st.stadium_name ASC, sa.seat_area_zone ASC";

        return jdbcTemplate.query(sql, nameMapper);
    }
	

}
