package com.kh.baseball.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.baseball.dao.TeamDao;
import com.kh.baseball.dto.TeamDto;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/team")
public class TeamController {
	
	@Autowired
	private TeamDao teamDao;
	
	@RequestMapping("/list")
	public String list(@ModelAttribute Model model) {
		
		List<TeamDto> list = teamDao.selectList();
		model.addAttribute("list", list);
		
		return "/WEB-INF/views/team/list.jsp";
	}
	
	@RequestMapping("/detail")
	public String detail(@RequestParam String teamName,
			Model model) {
		TeamDto teamDto = teamDao.selectOne(teamName);
		model.addAttribute("teamDto", teamDto);
		return "/WEB-INF/views/team/detail.jsp";
	}
}
