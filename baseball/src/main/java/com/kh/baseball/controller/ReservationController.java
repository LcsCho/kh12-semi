package com.kh.baseball.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.baseball.dao.ReservationDao;
import com.kh.baseball.dto.ReservationDto;


import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/reservation")
public class ReservationController {

	@Autowired
	private ReservationDao reservationDao;

	// 등록
	@GetMapping("/insert")
	public String insert() {
		return "/WEB-INF/views/admin/reservation/insert.jsp";
	}

	@PostMapping("/insert")
	public String insert(@ModelAttribute ReservationDto reservationDto) {
		reservationDao.insert(reservationDto);
		return "redirect:list";
	}

	// 상세
	@RequestMapping("/detail")
	public String detail(@RequestParam int reservationNo, Model model) {
		ReservationDto reservationDto = reservationDao.selectOne(reservationNo);
		return "/WEB-INF/views/admin/reservation/detail.jsp";
	}
	
	//수정
	@GetMapping("/change")
	public String change(Model model, int reservationNo) {
//		int reservationNo = (int) session.getAttribute("no");
		ReservationDto reservationDto = reservationDao.selectOne(reservationNo);
		model.addAttribute("reservationDto", reservationDto);
		return "/WEB-INF/views/admin/reservation/change.jsp";
	}
	
	
	@PostMapping("/change")
	public String change(@ModelAttribute ReservationDto inputDto) {
//		int reservationNo = (int) session.getAttribute("no");
		boolean result = reservationDao.update(inputDto);
		if(result) {
			return "redirect:detail?resetvationNo="+inputDto.getReservationNo();
		}
		else {
			return "redirect:error";
		}
	}
	//목록
	@RequestMapping("/list")
	public String list(Model model) {
		List<ReservationDto> list=reservationDao.selectList();
		model.addAttribute("list", list);
		return "/WEB-INF/views/admin/reservation/list.jsp";
	}


//취소
	@GetMapping("/cancel")
	public String cancel() {
		return "/WEB-INF/views/admin/reservation/list.jsp";
	}

	@PostMapping("/cancel")
	public String cancel(HttpSession session) {
		int reservationNo = (int) session.getAttribute("no");
		ReservationDto reservationDto = reservationDao.selectOne(reservationNo);
		return "redirect:cancelFinish";
	}

	@RequestMapping("/cancelFinish")
	public String exitFinish() {
		return "/WEB-INF/views/admin/reservation/cancelFinish.jsp";
	}
}