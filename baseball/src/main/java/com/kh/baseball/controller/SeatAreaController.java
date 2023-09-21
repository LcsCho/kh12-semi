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
import com.kh.baseball.dao.StadiumDao;
import com.kh.baseball.dto.SeatAreaDto;
import com.kh.baseball.dto.StadiumDto;

@Controller
@RequestMapping("/seatArea")
public class SeatAreaController {
	
	@Autowired
	private SeatAreaDao seatAreaDao;
	
	@Autowired
	private StadiumDao stadiumDao;
	
	@GetMapping("/insert")
	public String insert(@ModelAttribute StadiumDto stadiumDto, Model model) {
	 	List<StadiumDto> list = stadiumDao.selectList();
		 model.addAttribute("list", list);
		return "/WEB-INF/views/seatArea/insert.jsp";
	}
	
	@PostMapping("/insert")
	public String insert(@ModelAttribute SeatAreaDto seatAreaDto) {
		int seatAreaNo = seatAreaDao.sequenceSeatArea();
		seatAreaDto.setSeatAreaNo(seatAreaNo);
		seatAreaDao.insert(seatAreaDto);
		return "redirect:insertFinish";
	}
	
	@RequestMapping("/insertFinish")
	public String insertFinish() {
		return "/WEB-INF/views/seatArea/insertFinish.jsp";
	}
	
	
	
}
