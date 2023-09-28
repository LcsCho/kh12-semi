package com.kh.baseball.controller;

import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.baseball.dao.MatchDao;
import com.kh.baseball.dao.TeamDao;
import com.kh.baseball.dto.MatchDto;
import com.kh.baseball.dto.TeamDto;
import com.kh.baseball.vo.MatchVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class MenuController {
	
	@Autowired
	private TeamDao teamDao;
	
	@Autowired
	private MatchDao matchDao;


	@RequestMapping("/schedule/doosan")
	public String scheduleDoosan() {
		return "/WEB-INF/views/menu/scheduleDoosan.jsp";
	}	
	
	@RequestMapping("/schedule/lg")
	public String scheduleLg(Model model) {
		List<MatchVO> voList = matchDao.selectNoList();
		LocalDateTime now = LocalDateTime.now();
		Timestamp timestamp = Timestamp.valueOf(now);
		model.addAttribute("now", timestamp);
		model.addAttribute("voList", voList);
		return "/WEB-INF/views/menu/scheduleLg3.jsp";
	}	
	
	@RequestMapping("/reservationList")
	public String reservationList(Model model, TeamDto teamDto) {
		// List<MatchDto> list = matchDao.selectList();
		List<MatchVO> voList = matchDao.selectNoList();
		LocalDateTime now = LocalDateTime.now();
		Timestamp timestamp = Timestamp.valueOf(now);
		model.addAttribute("now", timestamp);
		model.addAttribute("voList", voList);
		
		
		// model.addAttribute("list",list);
		// return "/WEB-INF/views/menu/reservationList.jsp";
		return "/WEB-INF/views/menu/reservationListBackup.jsp";
	}	
	
	@RequestMapping("/teamInfo")
	public String teamInfo() {
		return "/WEB-INF/views/menu/teamInfo.jsp";
	}	
	
	@RequestMapping("/ranking")
	public String ranking(@ModelAttribute TeamDto teamDto, Model model) {
		List<TeamDto> list = teamDao.selectList();
		model.addAttribute("list", list);
		return "/WEB-INF/views/menu/ranking.jsp";
	}
		
	@RequestMapping("/rankingDetail")
	public String detail(@RequestParam int teamNo,
			Model model) {
		TeamDto teamDto = teamDao.selectOne(teamNo);
		model.addAttribute("teamDto", teamDto);
		return "/WEB-INF/views/menu/rankingDetail.jsp";
	}
}
