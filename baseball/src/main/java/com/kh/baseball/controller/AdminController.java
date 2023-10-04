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

import com.kh.baseball.dao.MatchDao;
import com.kh.baseball.dao.MemberDao;
import com.kh.baseball.dao.ReservationDao;
import com.kh.baseball.dao.SeatDao;
import com.kh.baseball.dao.TrueReservationDao;
import com.kh.baseball.dto.MemberDto;
import com.kh.baseball.dto.MemberListDto;
import com.kh.baseball.dto.ReservationCancelDto;
import com.kh.baseball.dto.ReservationDto;
import com.kh.baseball.dto.TrueReservationDto;
import com.kh.baseball.vo.AdminReservationListVO;
import com.kh.baseball.vo.PaginationVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/admin")
public class AdminController {

	@Autowired
	private MemberDao memberDao;
	
	@Autowired
	private ReservationDao reservationDao;
	
	@Autowired
	private MatchDao matchDao;
	
	@Autowired
	private SeatDao dao;
	
	@RequestMapping("/home")
	public String home() {
		return "/WEB-INF/views/admin/adminHome.jsp";
	}
	
	//목록
	@RequestMapping("/member/list")
	public String memberList(@ModelAttribute PaginationVO vo, Model model) {
		
		int count = memberDao.countList(vo); //상황에 맞는 게시글 수
		vo.setCount(count);		
		model.addAttribute("vo",vo);

		List<MemberListDto> list = memberDao.selectListByPage2(vo);
		model.addAttribute("list",list);
		
		return "/WEB-INF/views/admin/member/list.jsp";		
	}
	
	//상세
	@RequestMapping("/member/detail")
	public String memberDetail(@RequestParam String memberId, Model model) {
		//파라미터로 전달된 아이디의 회원정보를 조회하여 모델에 첨부
		MemberDto memberDto = memberDao.selectOne(memberId);
		model.addAttribute("memberDto", memberDto);
			
		return "/WEB-INF/views/admin/member/detail.jsp";
	}
	
	//수정
	@GetMapping("/member/edit")
	public String memberEdit(Model model, @RequestParam String memberId) {	
		MemberDto memberDto = memberDao.selectOne(memberId);
		model.addAttribute("memberDto",memberDto);
		return "/WEB-INF/views/admin/member/edit.jsp";
	}
	
	@PostMapping("/member/edit")
	public String memberEdit(@ModelAttribute MemberDto memberDto) {

		boolean result = memberDao.updateMemberInfoByAdmin(memberDto);
		if(result) {
			return "redirect:list";
		}
		else {
//			throw new NoTargetException("존재하지 않는 회원ID");
			return "redirect:error";
		}
	}
	
	//차단+해제 기능
	@RequestMapping("/member/block")
	public String memberBlock(@RequestParam String memberId) {
		memberDao.insertBlock(memberId);
		return "redirect:list";
	}
	
	@RequestMapping("/member/cancel")
	public String memberCancel(@RequestParam String memberId) {
		memberDao.deleteBlock(memberId);
		return "redirect:list";
	}
	
	@RequestMapping("/reservation/list")
	public String list(Model model,@ModelAttribute(name="vo") PaginationVO vo) {
		int count = reservationDao.count(vo);
		vo.setCount(count);
		
		
		List<AdminReservationListVO> list = reservationDao.reservationListByAdmin(vo);
		model.addAttribute("list",list);
		
		return "/WEB-INF/views/admin/reservation/list.jsp";
	};
	
	@RequestMapping("/reservation/detail")
	public String detail(@RequestParam int reservationNo,Model model) {
		AdminReservationListVO adminReservationListVO = reservationDao.reservationDetailByAdmin(reservationNo);
		model.addAttribute("adminReservationListVO",adminReservationListVO);
		return "/WEB-INF/views/admin/reservation/detail.jsp";
		
	}
	@Autowired
	private TrueReservationDao trueReservationDao;
	@GetMapping("/delete")
	public String delete() {
		return "/WEB-INF/views/admin/reservation/delete.jsp";
	}
	@PostMapping("/reservation/delete")
    public String deleteReservations(@ModelAttribute TrueReservationDto trueReservationDto,@ModelAttribute ReservationCancelDto reservationCancelDto,HttpSession session) {
		//memberId를 세션에있는 id로 저장해서 dto에 보냄
		String memberId = (String) session.getAttribute("name");
		reservationCancelDto.setMemberId(memberId);
		
		trueReservationDao.reservationCancelInsertBySeatNo(reservationCancelDto);
		trueReservationDao.reservationDeleteByTicket(trueReservationDto);
		trueReservationDao.seatStatusUpdate(trueReservationDto);
            return "redirect:list";
    }
}
