package com.kh.baseball.dao;


import com.kh.baseball.dto.MemberDto;
import com.kh.baseball.dto.MemberListDto;
import com.kh.baseball.vo.PaginationVO;
import com.kh.baseball.dto.MemberBlockDto;

public interface MemberDao {
	void insert(MemberDto memberDto);
	MemberDto selectOne(String memberId);
	boolean updateMemberLogin(String memberId);
	boolean updateMemberPw(String memberId, String changePw);
	boolean updateMemberInfo(MemberDto memberDto);
	boolean delete(String memberId);
<<<<<<< HEAD
	
	boolean updateMemberInfoByAdmin(MemberDto memberDto);
	
	List<MemberDto> selectListByPage(PaginationVO vo);
	List<MemberListDto> selectListByPage2(PaginationVO vo);
	int countList(PaginationVO vo);
	
	//차단+해제 기능
	void insertBlock(String memberId);
	boolean deleteBlock(String memberId);
	
	List<MemberBlockDto> selectBlockList();
	MemberBlockDto selectBlockOne(String memberId);
=======
	MemberDto selectOneByMemberNickname(String memberNick);
>>>>>>> refs/remotes/origin/main
}
