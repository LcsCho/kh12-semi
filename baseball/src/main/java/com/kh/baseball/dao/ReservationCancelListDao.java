package com.kh.baseball.dao;

import java.util.List;

import com.kh.baseball.vo.ReservationVO;


public interface ReservationCancelListDao {
	List<ReservationVO> reservationCancelListByMember(String memberId);

}
