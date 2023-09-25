package com.kh.baseball.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.baseball.dao.ReservationDao;
import com.kh.baseball.dto.ReservationCancelDto;
import com.kh.baseball.dto.ReservationDto;
import com.kh.baseball.vo.ReservationVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/member/reservation")
public class ReservationController {

	@Autowired
	private ReservationDao reservationDao;
	

	// 등록
//	@GetMapping("/insert")
//	public String insert(@ModelAttriubute ReservationDto reservationDto) {
//		return "/WEB-INF/views/admin/reservation/insert.jsp";
//	}
//
//	@PostMapping("/insert")
//	public String insert(ReservationDto reservationDto) {
//		reservationDao.insert(reservationDto);
//		return "redirect:list";
//	}

	// 상세
	@RequestMapping("/memberByList")
	public String reservationList(@RequestParam String memberId, Model model) {
		List<ReservationDto> list = reservationDao.selectList(memberId);
		model.addAttribute("list", list);
		return "/WEB-INF/views/member/reservation/memberByList.jsp";
	}
	
	@RequestMapping("/memberByDetail")
	public String reservationDetail(@ModelAttribute(name = "vo") ReservationVO vo, Model model) {
		ReservationDto reservationDto = reservationDao.selectOne(vo.getReservationNo());
		model.addAttribute("reservationDto", reservationDto);
		return "/WEB-INF/views/member/reservation/memberByDetail.jsp";
	}
	
	@RequestMapping("/cancel")
	public String cancel(@RequestParam int reservationNo) {
		reservationDao.cancel(reservationNo);
		return "redirect:cancelFinish";
	}
	
	@RequestMapping("/cancelFinish")
	public String cancelFinish() {
		return "/WEB-INF/views/member/reservation/cancelFinish.jsp";
	}
	
	@RequestMapping("/cancelList")
	public String cancelList(@ModelAttribute ReservationCancelDto reservationCancelDto
			, Model model, @RequestParam String memberId) {
		List<ReservationCancelDto> cancelList = reservationDao.cancelList(memberId);
		model.addAttribute("cancelList", cancelList);
		return "/WEB-INF/views/member/reservation/cancelList.jsp";
	}

}