package com.kh.baseball.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.baseball.dao.StadiumDao;
import com.kh.baseball.dto.StadiumDto;

@Controller
@RequestMapping("/stadium")
public class StadiumController {
	
	
	@Autowired
	private StadiumDao stadiumDao;
	
	@GetMapping("/insert")
	public String insert() {
		return "/WEB-INF/views/stadium/insert.jsp";
	}
	@PostMapping("/insert")
	public String insert(@ModelAttribute StadiumDto stadiumDto) {
		int stadiumNo = stadiumDao.sequence();
		stadiumDto.setStadiumNo(stadiumNo);
		stadiumDao.insertStadium(stadiumDto);
		return "redirect:insertFinish";
		
	}

}
