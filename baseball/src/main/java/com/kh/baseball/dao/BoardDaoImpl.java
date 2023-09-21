package com.kh.baseball.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.kh.baseball.dto.BoardDto;
import com.kh.baseball.mapper.BoardMapper;
import com.kh.baseball.vo.PaginationVO;

@Repository
public class BoardDaoImpl implements BoardDao{

	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	@Autowired
	private BoardMapper boardMapper;
	
	@Override
	public int sequence() {
		String sql = "select board_seq.nextval from dual";
		return jdbcTemplate.queryForObject(sql, int.class);
	}

	//등록
	@Override
	public void insert(BoardDto boardDto) {
		String sql = "insert into board("
				+ "board_no, board_writer, board_title, board_content"
				+ "values(?, ?, ?, ?, ?, ?, ?)";
		Object[] data = {boardDto.getBoardNo(),
								boardDto.getBoardWriter(),
								boardDto.getBoardTitle(), 
								boardDto.getBoardContent()
								};
		jdbcTemplate.update(sql, data);		
	}
	
	//조회
	@Override
	public List<BoardDto> selectList() {
		String sql = "select * from board order by board_no desc";
		return jdbcTemplate.query(sql, boardMapper);
	}
	
	//상세 조회
	@Override
	public BoardDto selectOne(int boardNo) {
		String sql = "select * from board where board_no=?";
		Object[] data = {boardNo};
		List<BoardDto> list = jdbcTemplate.query(sql, boardMapper, data);
		return list.isEmpty() ? null : list.get(0);
	}
	
	//수정
	@Override
	public boolean updateBoard(BoardDto boardDto) {
		String sql = "update board set board_title=?, board_content=?, board_utime=sysdate "
				+ "where board_no=?";
		Object[] data = {boardDto.getBoardTitle(), boardDto.getBoardContent(),
				boardDto.getBoardNo()};
		return jdbcTemplate.update(sql, data) > 0;
	}
	
	//삭제
	@Override
	public boolean deleteBoard(int boardNo) {
		String sql = "delete board where board_no=?";
		Object[] data = {boardNo};
		return jdbcTemplate.update(sql, data) >0;
	}
	
	//조회수
	@Override
	public boolean updateBoardReadcount(int boardNo) {
		String sql = "update board set board_readcount = board_readcount+1 "
				+ "where board_no=?";
		Object[] data = {boardNo};
		return jdbcTemplate.update(sql, data) >0;
	}
	
	//수정 시각
	@Override
	public boolean updateBoardUtime(int boardNo) {
		String sql = "update board set board_utime = sysdate where board_no=?";
		Object[] data = {boardNo};
		return jdbcTemplate.update(sql, data) >0;
	}
	
	
	//페이징 추가된 검색+목록
	@Override
	public List<BoardDto> selectListByPage(PaginationVO vo) {
		if(vo.isSearch()) {
			String sql = "select * from ("
								+ "select rownum rn, TMP.* from ("
									+ "select * from board "
									+ "where instr("+vo.getType()+", ?) > 0 "
									+ "order by "+vo.getType()+" asc"
								+ ")TMP"
							+ ") where rn between ? and ?";
			Object[] data = {vo.getKeyword(), vo.getStartRow(), vo.getFinishRow()};
			return jdbcTemplate.query(sql, boardMapper, data);
		}
		else {
			String sql = "select * from ("
								+ "select rownum rn, TMP.* from ("
									+ "select * from board "
									+ "order by board_no desc"
								+ ")TMP"
							+ ") where rn between ? and ?";
			Object[] data = {vo.getStartRow(), vo.getFinishRow()};
			return jdbcTemplate.query(sql, boardMapper, data);
		}
	}

	//목록 + 검색
	@Override
	public int countList(PaginationVO vo) {
		if(vo.isSearch()) {//검색
			String sql = "select count(*) from board where instr("+vo.getType()+",?) >0";
			Object[] data = {vo.getKeyword()};
			return jdbcTemplate.queryForObject(sql, int.class, data);
		}
		else {//목록
			String sql = "select count(*) from board";
			return jdbcTemplate.queryForObject(sql, int.class);
		}
	}

}
