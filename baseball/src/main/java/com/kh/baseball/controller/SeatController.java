package com.kh.baseball.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.baseball.dao.SeatAreaDao;
import com.kh.baseball.dao.SeatDao;
import com.kh.baseball.dto.SeatAreaDto;
import com.kh.baseball.dto.SeatDto;

@Controller
@RequestMapping("/seat")
public class SeatController {
	
	@Autowired
	private SeatDao seatDao;
	
	@Autowired
	private SeatAreaDao seatAreaDao;
	
	@GetMapping("/insert")
	public String insert(@ModelAttribute SeatDto seatDto, Model model) {
		List<SeatAreaDto> list = seatAreaDao.selectList();
		model.addAttribute("list", list);
		return "/WEB-INF/views/seat/insert.jsp";
	}
	
	@PostMapping("/insert")
	public String insert(@ModelAttribute SeatDto seatDto) {
		seatDao.insert(seatDto);
		return "redirect:insertFinish";
	}
}
