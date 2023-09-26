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
import com.kh.baseball.dto.ReservationCancelDto;
import com.kh.baseball.dto.ReservationDto;
import com.kh.baseball.dto.TrueReservationDto;
import com.kh.baseball.vo.ReservationVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/reservation")
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
	public String cancelList(@ModelAttribute ReservationCancelDto reservationCancelDto, Model model,
			@RequestParam String memberId) {
		List<ReservationCancelDto> cancelList = reservationDao.cancelList(memberId);
		model.addAttribute("cancelList", cancelList);
		return "/WEB-INF/views/member/reservation/cancelList.jsp";
	}

	@GetMapping("/insert")
	public String insert(@ModelAttribute TrueReservationDto trueReservationDto,   Model model) {
		
		
		
    		//, @RequestParam int seatNo,
//    		@RequestParam int seatAreaNo,@RequestParam int reservationTicket) {
//		 세션에서 아이디를 가져옵니다.
//		 List<ReservationVO> reservationInfo = reservationDao.getMatchInfo(matchNo);
//
//		 TrueReservationDto 객체 생성 및
//
//	채우기 (선택한 정보로)
//		 TrueReservationDto trueReservationDto = new TrueReservationDto();
//        trueReservationDto.setMatchNo(matchNo);
//        trueReservationDto.setSeatNo(seatNo);
//        trueReservationDto.setMemberId(memberId);
//      trueReservationDto.setSeatAreaNo(seatAreaNo);
//       trueReservationDto.setReservationTicket(reservationTicket);
       

		// 나머지 필드도 설정

		// 모델에 데이터를 추가하여 뷰로 전달
		// model.addAttribute("trueReservationDto", trueReservationDto);
		// model.addAttribute("reservationInfo", reservationInfo); // 예약 정보를 모델에 추가합니다.

		return "/WEB-INF/views/reservation/insert.jsp";
	}

	@PostMapping("/insert")
	public String insertPost(TrueReservationDto trueReservationDto) {
		// POST 요청을 처리하는 코드를 작성합니다.
		// trueReservationDto 객체에 클라이언트로부터 전송된 데이터가 자동으로 바인딩됩니다.
		// 따라서 여기에서 데이터베이스에 삽입 등의 작업을 수행합니다.

		// reservationDao를 사용하여 데이터베이스에 삽입 등의 작업을 수행합니다.
		// reservationDao.insertReservation(trueReservationDto);

		return "redirect:/success"; // 성공 페이지로 리다이렉트합니다.

	}

}