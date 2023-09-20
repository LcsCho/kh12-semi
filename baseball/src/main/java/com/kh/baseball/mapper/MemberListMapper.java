package com.kh.baseball.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Component;

import com.kh.baseball.dto.MemberListDto;

@Component
public class MemberListMapper implements RowMapper<MemberListDto>{

	@Override
	public MemberListDto mapRow(ResultSet rs, int rowNum) throws SQLException {
		MemberListDto memberListDto = new MemberListDto();
		memberListDto.setMemberId(rs.getString("member_id"));
		memberListDto.setMemberPw(rs.getString("member_pw"));
		memberListDto.setMemberNick(rs.getString("member_nick"));
		memberListDto.setMemberTel(rs.getString("member_tel"));
		memberListDto.setMemberBirth(rs.getDate("member_birth"));
		memberListDto.setMemberEmail(rs.getString("member_email"));
		memberListDto.setMemberJoin(rs.getDate("member_join"));
		memberListDto.setMemberLastLogin(rs.getDate("member_last_login"));
		memberListDto.setMemberLastUpdate(rs.getDate("member_last_update"));
		memberListDto.setMemberLevel(rs.getString("member_level"));
		memberListDto.setMemberPost(rs.getString("member_post"));
		memberListDto.setMemberAddr1(rs.getString("member_addr1"));
		memberListDto.setMemberAddr2(rs.getString("member_addr2"));
		memberListDto.setBlock(rs.getString("block"));
		return memberListDto;
	}
	
}
