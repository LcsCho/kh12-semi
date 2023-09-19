package com.kh.baseball.dao;

import org.springframework.stereotype.Repository;

import com.kh.baseball.dto.MemberDto;

@Repository
public class MemberDaoImpl implements MemberDao{

	@Override
	public void insert(MemberDto memberDto) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public MemberDto selectOne(String memberId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean updateMemberInfo(MemberDto memberDto) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean delete(String memberId) {
		// TODO Auto-generated method stub
		return false;
	}

}
