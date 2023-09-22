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

import com.kh.baseball.dao.BoardDao;
import com.kh.baseball.dao.MemberDao;
import com.kh.baseball.dto.BoardDto;
import com.kh.baseball.dto.MemberDto;
import com.kh.baseball.vo.PaginationVO;

@Controller
@RequestMapping("/board")
public class BoardController {

	@Autowired
	private BoardDao boardDao;

	@Autowired
	private MemberDao memberDao;

	// 등록
	@GetMapping("/write")
	public String write() {
		return "/WEB-INF/views/board/write.jsp";
	}

	@PostMapping("/write")
	public String write(@ModelAttribute BoardDto boardDto) {
		int boardNo = boardDao.sequence();
		boardDto.setBoardNo(boardNo);
		boardDao.insert(boardDto);
		return "redirect:detail?boardNo=" + boardNo;
	}

	// 목록
	@RequestMapping("/list")
	public String list(@ModelAttribute(name = "vo") PaginationVO vo, Model model) {
		int count = boardDao.countList(vo);
		vo.setCount(count);

		List<BoardDto> list = boardDao.selectListByPage(vo);
		model.addAttribute("list", list);

		return "/WEB-INF/views/board/list2.jsp";
	}

	// 상세
	@RequestMapping("/detail")
	public String detail(@RequestParam int boardNo, Model model, HttpSession session) {
		BoardDto boardDto = boardDao.selectOne(boardNo);// 조회
		model.addAttribute("boardDto", boardDto);
		// 작성자의 회원정보 추가
		String boardWriter = boardDto.getBoardWriter();
		if (boardWriter != null) {
			MemberDto memberDto = memberDao.selectOne(boardWriter);
			model.addAttribute("writerDto", memberDto);
		}
		return "/WEB-INF/views/board/detail.jsp";
	}

	// 삭제
	@RequestMapping("/delete")
	public String delete(@RequestParam int boardNo) {
		boolean result = boardDao.deleteBoard(boardNo);
		if (result) {
			return "redirect:list";
		} else {
			return "redirect:에러페이지";
//			throw new NoTargetException("없는 게시글 번호");
		}
	}

	// 수정
	@GetMapping("/edit")
	public String edit(@RequestParam int boardNo, Model model) {
		BoardDto boardDto = boardDao.selectOne(boardNo);
		model.addAttribute("boardDto", boardDto);
		return "/WEB-INF/views/board/edit.jsp";
	}

	@PostMapping("/edit")
	public String edit(@ModelAttribute BoardDto boardDto) {
		boolean result = boardDao.updateBoard(boardDto);
//			if(result) {
		return "redirect:detail?boardNo=" + boardDto.getBoardNo();
//			}
//			else {
//				throw new NoTargetException("존재하지 않는 글번호");
	}

	// 관리자가 이용하는 선택삭제 기능
	@PostMapping("/deleteByAdmin")
	public String deleteByAdmin(@RequestParam List<Integer> boardNoList) {
		for (int boardNo : boardNoList) {
			boardDao.deleteBoard(boardNo);
		}
		return "redirect:list";
	}
}