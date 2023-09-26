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
import com.kh.baseball.dao.TrueReservationDao;
import com.kh.baseball.dto.ReservationCancelDto;
import com.kh.baseball.dto.ReservationDto;
import com.kh.baseball.dto.SeatListDto;
import com.kh.baseball.dto.TrueReservationDto;
import com.kh.baseball.vo.ReservationVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/reservation")
public class ReservationController {

	@Autowired
	private ReservationDao reservationDao;
	
	@Autowired
	private TrueReservationDao trueReservationDao;

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
	public String cancelList(@ModelAttribute ReservationCancelDto reservationCancelDto, Model model,
			@RequestParam String memberId) {
		List<ReservationCancelDto> cancelList = reservationDao.cancelList(memberId);
		model.addAttribute("cancelList", cancelList);
		return "/WEB-INF/views/member/reservation/cancelList.jsp";
	}

	@GetMapping("/insert")
	public String insert(@ModelAttribute TrueReservationDto trueReservationDto,   Model model,
			@RequestParam int matchNo) {
		//경기정보 리스트
		List<ReservationVO> list = trueReservationDao.selectList(matchNo);
		model.addAttribute("list", list);
		model.addAttribute("matchNo",matchNo);
		
		//아이디 저장
		trueReservationDto.setMatchNo(matchNo);
		
		return "/WEB-INF/views/reservation/insert.jsp";
	}

	@PostMapping("/insert")
	public String insertPost(TrueReservationDto trueReservationDto,HttpSession session,@RequestParam int matchNo,Model model) {
		// POST 요청을 처리하는 코드를 작성합니다.
		// trueReservationDto 객체에 클라이언트로부터 전송된 데이터가 자동으로 바인딩됩니다.
		String memberId =  (String) session.getAttribute("name");
		trueReservationDto.setMemberId(memberId);
		trueReservationDto.setMatchNo(matchNo);
		model.addAttribute("matchNo",matchNo);
		
		trueReservationDao.insert(trueReservationDto);

		return "redirect:list"; // 성공 페이지로 리다이렉트합니다.
		

	}

	
}