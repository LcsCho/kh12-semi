package com.kh.baseball.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.kh.baseball.dto.SeatDto;
import com.kh.baseball.dto.SeatGroupDto;
import com.kh.baseball.dto.SeatListDto;
import com.kh.baseball.mapper.SeatGourpMapper;
import com.kh.baseball.mapper.SeatListMapper;
import com.kh.baseball.mapper.SeatMapper;
import com.kh.baseball.vo.PaginationVO;

@Repository
public class SeatDaoImpl implements SeatDao {

	@Autowired
	private JdbcTemplate jdbcTemplate;

	@Autowired
	private SeatMapper seatMapper;

	@Override
	public void insert(SeatDto seatDto) {
		// 2중 for문으로 행열의 곱으로 좌석을 생성한다
		String sql = "insert into seat(seat_no, seat_area_no, "
					+ "seat_row, seat_col, seat_status) "
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

//	@Override
//	public SeatDto selectOne(int seatNo) {
//		String sql = "select * from seat where seat_no=?";
//		Object[] data = { seatNo };
//		List<SeatDto> list = jdbcTemplate.query(sql, seatMapper, data);
//
//		return list.isEmpty() ? null : list.get(0);
//	}

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
		String sql = "INSERT INTO seat(seat_no,seat_area_no,"
				+ " seat_row, seat_col, seat_status) VALUES (seat_no_seq.nextval,?, ?, ?, ?)";
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
		String sql = "SELECT * FROM (" +
		        "SELECT " +
		        "s.seat_no, " +
		        "sa.seat_area_no, " +
		        "st.stadium_name, " +
		        "sa.seat_area_price," +
		        "sa.seat_area_zone, " +
		        "s.seat_col, " +
		        "s.seat_row, " +
		        "s.seat_status, " +
		        "st.stadium_no, " +
		        "ROW_NUMBER() OVER(PARTITION BY st.stadium_name ORDER BY s.seat_no) AS rn " +
		        "FROM " +
		        "seat s " +
		        "INNER JOIN " +
		        "seat_area sa ON s.seat_area_no = sa.seat_area_no " +
		        "INNER JOIN " +
		        "stadium st ON sa.stadium_no = st.stadium_no) temp " +
		        "WHERE rn = 1";
				
		return jdbcTemplate.query(sql,seatListMapper);	
		}

	@Override
	public boolean seatStatusUpsate(SeatListDto seatListDto) {
		//경기장의 구역을 지정하여 열과 행을 입력하면 좌석의 상태를 수정할 수 있는 구문 생성
		String sql = "UPDATE seat s "
				+ "SET s.seat_status = ? "
				+ "WHERE s.seat_col = ? AND s.seat_row = ? AND "
				+ "EXISTS ("
				+ "SELECT 1 FROM seat_area sa "
				+ "INNER JOIN stadium st ON sa.stadium_no = st.stadium_no "
				+ "WHERE sa.seat_area_no = s.seat_area_no AND st.stadium_name = ? AND sa.seat_area_zone = ?)";
		Object[] data = {seatListDto.getSeatStatus(),
				seatListDto.getSeatCol(),
				seatListDto.getSeatRow(),
				seatListDto.getStadiumName(),
				seatListDto.getSeatAreaZone()};
				
		return jdbcTemplate.update(sql,data)>0;
	}

	@Override
	public SeatListDto selectForSeatUpdate(String seatAreaZone,int seatCol, int seatRow, String stadiumName) {
		//update 문을 실행하기 위한 좌석구역과 경기장 이름 ,열 행으로 상태를 좌석을 찾아 상태를 찾는 sql 만들어야함
		 String sql = "SELECT s.seat_no, sa.seat_area_no, st.stadium_name, sa.seat_area_price, sa.seat_area_zone, s.seat_col, s.seat_row, s.seat_status, st.stadium_no "
	                + "FROM seat s "
	                + "INNER JOIN seat_area sa ON s.seat_area_no = sa.seat_area_no "
	                + "INNER JOIN stadium st ON sa.stadium_no = st.stadium_no "
	                + "WHERE seat_area_zone=? and seat_col = ? and seat_row=? and stadium_name=?";
				
				
		
		Object[] data = {seatAreaZone, seatCol, seatRow, stadiumName};
		List<SeatListDto> list = jdbcTemplate.query(sql, seatListMapper, data);
		return list.isEmpty()? null:list.get(0);
	}
	@Override
	public SeatListDto selectOne(int seatNo) {
		//update 문을 실행하기 위한 좌석구역과 경기장 이름 ,열 행으로 상태를 좌석을 찾아 상태를 찾는 sql 만들어야함
		 String sql = "SELECT s.seat_no, sa.seat_area_no, st.stadium_name, sa.seat_area_price,"
		 		+ " sa.seat_area_zone, s.seat_col, s.seat_row, s.seat_status, st.stadium_no "
	                + "FROM seat s "
	                + "INNER JOIN seat_area sa ON s.seat_area_no = sa.seat_area_no "
	                + "INNER JOIN stadium st ON sa.stadium_no = st.stadium_no "
	                + "WHERE seat_no=?";
		Object[] data = {seatNo};
		List<SeatListDto> list = jdbcTemplate.query(sql, seatListMapper, data);
		return list.isEmpty()? null:list.get(0);
	}
	
	
	@Override
	public List<SeatListDto> seatGroupZoneList(PaginationVO vo,String seatAreaZone,String stadiumName) {
		// 좌석상태와 경기장이름 좌석구역을 확인 할 수 있는 리스트 출력
		String sql = "select * from ("
				+ "select rownum rn, TMP.* from ("
				+ "SELECT s.seat_no, sa.seat_area_no, st.stadium_name, sa.seat_area_price, sa.seat_area_zone, s.seat_col, s.seat_row, s.seat_status, st.stadium_no FROM seat s INNER JOIN seat_area sa ON s.seat_area_no = sa.seat_area_no INNER JOIN stadium st ON sa.stadium_no = st.stadium_no where seat_area_zone=? and stadium_name=?"
			+ ")TMP"
		+ ") where rn between ? and ?";
		
		
		return jdbcTemplate.query(sql,seatListMapper,seatAreaZone,stadiumName, vo.getStartRow(), vo.getFinishRow());	
		}

	
	
	
	@Autowired
	private SeatGourpMapper seatGourpMapper;

	@Override
	public List<SeatGroupDto> seatGroupStadiumList(String stadiumName) {
		String sql = "SELECT "
	             + "sa.seat_area_zone, "
	             + "st.stadium_name, "
	             + "sa.seat_area_no, "  // 콤마 추가
	             + "COUNT(*) AS seat_count "
	             + "FROM "
	             + "seat s "
	             + "INNER JOIN "
	             + "seat_area sa ON s.seat_area_no = sa.seat_area_no "
	             + "INNER JOIN "
	             + "stadium st ON sa.stadium_no = st.stadium_no "
	             + "WHERE "
	             + "st.stadium_name = ? "
	             + "GROUP BY "
	             + "sa.seat_area_zone, "
	             + "st.stadium_name,"
	             + "sa.seat_area_no";
		return jdbcTemplate.query(sql,seatGourpMapper,stadiumName);	
		}

	@Override
	public int countList(PaginationVO vo, String seatAreaZone, String stadiumName) {
		String sql = "SELECT COUNT(*)FROM seat s INNER JOIN seat_area sa ON s.seat_area_no = sa.seat_area_no INNER JOIN stadium st ON sa.stadium_no = st.stadium_no WHERE sa.SEAT_AREA_ZONE = ?  and st.stadium_name = ? GROUP BY sa.seat_area_zone, st.stadium_name";
		return jdbcTemplate.queryForObject(sql, int.class,seatAreaZone,stadiumName);
	}

}
