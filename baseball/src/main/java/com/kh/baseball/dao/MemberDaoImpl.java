package com.kh.baseball.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.kh.baseball.dto.MemberBlockDto;
import com.kh.baseball.dto.MemberDto;
import com.kh.baseball.dto.MemberListDto;
import com.kh.baseball.mapper.MemberBlockMapper;
import com.kh.baseball.mapper.MemberListMapper;
import com.kh.baseball.mapper.MemberMapper;
import com.kh.baseball.vo.PaginationVO;


@Repository
public class MemberDaoImpl implements MemberDao{

	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	@Autowired
	private MemberMapper memberMapper;
	
	@Autowired
	private MemberListMapper memberListMapper;
	
	@Override
	public void insert(MemberDto memberDto) {
		String sql = "insert into member("
				+ "member_id, member_pw, member_nick, "
				+ "member_tel, member_birth, member_email, "
				+ "member_post, member_addr1, member_addr2"
			+ ") "
			+ "values(?, ?, ?, ?, ?, ?, ?, ?, ?)";
		Object[] data = {
			memberDto.getMemberId(), memberDto.getMemberPw(),
			memberDto.getMemberNick(), memberDto.getMemberTel(),
			memberDto.getMemberBirth(), memberDto.getMemberEmail(),
			memberDto.getMemberPost(), memberDto.getMemberAddr1(), 
			memberDto.getMemberAddr2()
		};
		jdbcTemplate.update(sql, data);
		
	}

	@Override
	public MemberDto selectOne(String memberId) {
		String sql = "select * from member where member_id=?";
		Object[] data = {memberId};
		List<MemberDto> list = jdbcTemplate.query(sql, memberMapper, data);
		return list.isEmpty() ? null : list.get(0);
	}

	@Override
	public boolean updateMemberInfo(MemberDto memberDto) {
		String sql = "update member set "
				+ "member_nick = ?, member_tel = ?, "
				+ "member_birth = ?, member_email = ?, "
				+ "member_post = ?, member_addr1 = ?, member_addr2 = ? "
				+ "where member_id = ?";
		Object[] data = {
			memberDto.getMemberNick(), memberDto.getMemberTel(),
			memberDto.getMemberBirth(), memberDto.getMemberEmail(), 
			memberDto.getMemberPost(), memberDto.getMemberAddr1(), 
			memberDto.getMemberAddr2(), memberDto.getMemberId()
		};
		return jdbcTemplate.update(sql, data) > 0;
	}

	@Override
	public boolean delete(String memberId) {
		String sql = "delete member where member_id = ?";
		Object[] data = {memberId};
		return jdbcTemplate.update(sql, data) > 0;
	}

	@Override
	public boolean updateMemberLogin(String memberId) {
		String sql = "update member "
						+ "set member_last_login=sysdate "
						+ "where member_id = ?";
		Object[] data = {memberId};
		return jdbcTemplate.update(sql, data) > 0;
	}

	@Override
	public boolean updateMemberPw(String memberId, String changePw) {
		String sql = "update member "
						+ "set member_pw=?, member_last_update=sysdate "
						+ "where member_id=?";
		Object[] data = {changePw, memberId};
		return jdbcTemplate.update(sql, data) > 0;
	}
	
	//관리자
	//목록+검색 처리
	@Override
	public int countList(PaginationVO vo) {
		if(vo.isSearch()) {//검색에 따른 카운트 결과
			String sql = "select count(*) from member where instr("+vo.getType()+",?)>0";
			Object[] data = {vo.getKeyword()};
			return jdbcTemplate.queryForObject(sql, int.class, data);
		}
		else {//목록에 따른 카운트 결과
			String sql = "select count(*) from member";
		return jdbcTemplate.queryForObject(sql, int.class);
		}
	}

	@Override
	public List<MemberDto> selectListByPage(PaginationVO vo) {
		if(vo.isSearch()) {
			String sql = "select * from ("
								+ "select rownum rn, TMP.* from ("
									+ "select * from member "
									+ "where instr("+vo.getType()+", ?) > 0 "
									+ "and member_level != '관리자' "
									+ "order by "+vo.getType()+" asc"
								+ ")TMP"
							+ ") where rn between ? and ?";
			Object[] data = {vo.getKeyword(), vo.getStartRow(), vo.getFinishRow()};
			return jdbcTemplate.query(sql, memberMapper, data);
		}
		else {
			String sql = "select * from ("
								+ "select rownum rn, TMP.* from ("
									+ "select * from member "
									+ "where member_level != '관리자' "
									+ "order by member_id asc"
								+ ")TMP"
							+ ") where rn between ? and ?";
			Object[] data = {vo.getStartRow(), vo.getFinishRow()};
			return jdbcTemplate.query(sql, memberMapper, data);
		}
	}
	
	@Override
	public boolean updateMemberInfoByAdmin(MemberDto memberDto) {
		String sql = "update member set "
				+ "member_nick=?, "
				+ "member_email=?, "
				+ "member_tel=?, "
				+ "member_birth=?, "
				+ "member_post=?, "
				+ "member_addr1=?, "
				+ "member_addr2=?, "
				+ "member_level=? "
				+ "where member_id=?";
		Object[] data = {memberDto.getMemberNick(), 
				memberDto.getMemberEmail(),
				memberDto.getMemberTel(), 
				memberDto.getMemberBirth(), 
				memberDto.getMemberPost(),
				memberDto.getMemberAddr1(), 
				memberDto.getMemberAddr2(), 
				memberDto.getMemberLevel(),
				memberDto.getMemberId()};
		return jdbcTemplate.update(sql, data) >0; 
	}
	
	//차단+해제 기능
	@Override
	public void insertBlock(String memberId) {
		String sql = "insert into member_block(member_id) values(?)";
		Object[] data = {memberId};
		jdbcTemplate.update(sql, data);
	}
	
	@Override
	public boolean deleteBlock(String memberId) {
		String sql = "delete member_block where member_id=?";
		Object[] data = {memberId};
		return jdbcTemplate.update(sql, data) > 0;
	}
	
	public List<MemberListDto> selectListByPage2(PaginationVO vo) {
		if(vo.isSearch()) {
			String sql = "select * from ("
								+ "select rownum rn, TMP.* from ("
									+ "select * from member_list "
									+ "where instr("+vo.getType()+", ?) > 0 "
									+ "and member_level != '관리자' "
									+ "order by "+vo.getType()+" asc"
								+ ")TMP"
							+ ") where rn between ? and ?";
			Object[] data = {vo.getKeyword(), vo.getStartRow(), vo.getFinishRow()};
			return jdbcTemplate.query(sql, memberListMapper, data);
		}
		else {
			String sql = "select * from ("
								+ "select rownum rn, TMP.* from ("
									+ "select * from member_list "
									+ "where member_level != '관리자' "
									+ "order by member_id asc"
								+ ")TMP"
							+ ") where rn between ? and ?";
			Object[] data = {vo.getStartRow(), vo.getFinishRow()};
			return jdbcTemplate.query(sql, memberListMapper, data);
		}
	}
	
	@Autowired
	private MemberBlockMapper memberBlockMapper;
	
	@Override
	public List<MemberBlockDto> selectBlockList() {
		String sql = "select * from member_block order by block_time asc";
		return jdbcTemplate.query(sql, memberBlockMapper);
	}
	
	@Override
	public MemberBlockDto selectBlockOne(String memberId) {
		String sql = "select * from member_block where member_id=?";
		Object[] data = {memberId};
		List<MemberBlockDto> list = jdbcTemplate.query(sql, memberBlockMapper, data);
		return list.isEmpty() ? null : list.get(0);
	}

	@Override
	public MemberDto selectOneByMemberNickname(String memberNick) {
		String sql = "select * from member where member_nick = ?";
		Object[] data = {memberNick};
		List<MemberDto> list = jdbcTemplate.query(sql, memberMapper, data);
		return list.isEmpty() ? null : list.get(0);
	}
	
}

