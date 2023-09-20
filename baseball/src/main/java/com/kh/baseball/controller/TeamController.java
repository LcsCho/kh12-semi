package com.kh.baseball.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
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
	public String list(@ModelAttribute TeamDto teamDto, Model model) {
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
	
	@GetMapping("/register")
	public String register() {
		return "/WEB-INF/views/team/register.jsp";
	}
	
	@PostMapping("/register")
	public String register(@ModelAttribute TeamDto teamDto) {
		int teamNo = teamDao.sequenceTeam();
		teamDto.setTeamNo(teamNo);
		teamDao.insert(teamDto);
		return "redirect:registerFinish";
	}
	
	@RequestMapping("/registerFinish")
	public String registerFinish() {
		return "/WEB-INF/views/team/registerFinish.jsp";
	}
}
