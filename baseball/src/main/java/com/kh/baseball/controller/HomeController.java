package com.kh.baseball.controller;

import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.baseball.dao.MatchDao;
import com.kh.baseball.dto.TeamDto;
import com.kh.baseball.vo.MatchVO;

@Controller
public class HomeController {
	
	@Autowired MatchDao matchDao;
	
	@RequestMapping("/")
	public String home(Model model, TeamDto teamDto) {
		List<MatchVO> voList = matchDao.selectNoList();
		LocalDateTime now = LocalDateTime.now();
		Timestamp timestamp = Timestamp.valueOf(now);
		model.addAttribute("now", timestamp);
		model.addAttribute("voList", voList);
		return "/WEB-INF/views/home.jsp";
	}
}
