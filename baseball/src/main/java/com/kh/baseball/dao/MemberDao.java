package com.kh.baseball.dao;

import java.util.List;

import com.kh.baseball.dto.MemberDto;

public interface MemberDao {
	void insert(MemberDto memberDto);
	MemberDto selectOne(String memberId);
	
	boolean updateMemberInfo(MemberDto memberDto);
	boolean delete(String memberId);
}
