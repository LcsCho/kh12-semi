package com.kh.baseball.dao;

import java.util.List;

import com.kh.baseball.vo.PaginationVO;
import com.kh.baseball.vo.ReservationVO;


public interface ReservationCancelListDao {
	List<ReservationVO> reservationCancelListByMember(PaginationVO vo,String memberId);
	int countList(PaginationVO vo,String memberId);
}
