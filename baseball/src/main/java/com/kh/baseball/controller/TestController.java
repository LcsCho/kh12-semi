package com.kh.baseball.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.AutoConfiguration;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.baseball.dao.SeatAreaDao;
import com.kh.baseball.dao.SeatDao;
import com.kh.baseball.dao.StadiumDao;
import com.kh.baseball.dto.SeatAreaDto;
import com.kh.baseball.dto.SeatDto;
import com.kh.baseball.dto.StadiumDto;



@Controller
@RequestMapping("/test")
public class TestController {
	
	@Autowired
	private StadiumDao stadiumDao;
	
	@Autowired
	private SeatDao seatDao;
	
	@Autowired
	private SeatAreaDao seatAreaDao;
	
	
	@GetMapping("/sta")
	public String sta(@ModelAttribute SeatDto seatDto, StadiumDto stadiumDto, SeatAreaDto seatAreaDto, Model model) {
		List<SeatAreaDto> seatarealist = seatAreaDao.selectList();
		List<StadiumDto> stadiumlist = stadiumDao.selectList();
		model.addAttribute("seatarealist", seatarealist);
		model.addAttribute("stadiumlist", stadiumlist);
		return "/WEB-INF/views/test/sta.jsp";
	}
	
	@PostMapping("/sta")
	public String sta(@ModelAttribute SeatAreaDto seatAreaDto, StadiumDto stadiumDto) {
	    stadiumDao.insert(stadiumDto);
		seatAreaDao.insert(seatAreaDto);
	    return "redirect:staFinish";
	}
	
	@RequestMapping("/staFinish")
	public String staFinish() {
		return "/WEB-INF/views/test/staFinish.jsp";
	}
}
