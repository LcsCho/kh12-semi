package com.kh.baseball.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Component;

import com.kh.baseball.dto.MemberDto;

@Component
public class MemberMapper implements RowMapper<MemberDto>{

	@Override
	public MemberDto mapRow(ResultSet rs, int rowNum) throws SQLException {
		MemberDto memberDto = new MemberDto();
		memberDto.setMemberId(rs.getString("member_id"));
		memberDto.setMemberPw(rs.getString("member_pw"));
		memberDto.setMemberNick(rs.getString("member_nick"));
		memberDto.setMemberTel(rs.getString("member_tel"));
		memberDto.setMemberBirth(rs.getDate("member_birth"));
		memberDto.setMemberEmail(rs.getString("member_email"));
		memberDto.setMemberJoin(rs.getDate("member_join"));
		memberDto.setMemberLastLogin(rs.getDate("member_last_login"));
		memberDto.setMemberLastUpdate(rs.getDate("member_last_update"));
		memberDto.setMemberLevel(rs.getString("member_level"));
		memberDto.setMemberPost(rs.getString("member_post"));
		memberDto.setMemberAddr1(rs.getString("member_addr1"));
		memberDto.setMemberAddr2(rs.getString("member_addr2"));
		return memberDto;
	}
}
