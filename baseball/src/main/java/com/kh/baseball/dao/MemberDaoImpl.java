package com.kh.baseball.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.kh.baseball.dto.MemberDto;
import com.kh.baseball.mapper.MemberMapper;


@Repository
public class MemberDaoImpl implements MemberDao{

	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	@Autowired
	private MemberMapper memberMapper;
	
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

	@Override
	public MemberDto selectOneByMemberNickname(String memberNick) {
		String sql = "select * from member where member_nickname = ?";
		Object[] data = {memberNick};
		List<MemberDto> list = jdbcTemplate.query(sql, memberMapper, data);
		return list.isEmpty() ? null : list.get(0);
	}

}
