package com.kh.baseball.rest;

import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.kh.baseball.dao.YReservationDao;
import com.kh.baseball.dto.TrueReservationDto;

@CrossOrigin
@RestController
@RequestMapping("/rest/reservation")
public class ReservationRestController {

	@PostMapping("/insert")
	public void insert(@ModelAttribute TrueReservationDto trueReservationDto) {
		int reservationNo = YReservationDao.sequence();
		TrueReservationDto.set
	}
}
