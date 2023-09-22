package com.kh.baseball.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.baseball.dao.MatchDao;
import com.kh.baseball.dao.StadiumDao;
import com.kh.baseball.dao.TeamDao;
import com.kh.baseball.dto.MatchDto;
import com.kh.baseball.dto.StadiumDto;
import com.kh.baseball.dto.TeamDto;
@Repository
@RequestMapping("/admin/match")
public class MatchController {
	@Autowired 
	private MatchDao matchDao;
	
	@Autowired
	private TeamDao teamDao;
	
	@Autowired
	private StadiumDao stadiumDao;
	
	
	@GetMapping("/insert")
	public String insert(@ModelAttribute TeamDto teamDto, StadiumDto stadiumDto, Model model) {
		List<TeamDto> teamList = teamDao.selectList();
		List<StadiumDto> stadiumList = stadiumDao.selectList();
		model.addAttribute("teamList", teamList);
		model.addAttribute("stadiumList", stadiumList);
		
		return "/WEB-INF/views/admin/match/insert.jsp";
	}
	@PostMapping("/insert")
	public String insert(@ModelAttribute MatchDto matchDto) {
		int matchNo = matchDao.sequence();
		matchDto.setMatchNo(matchNo);
		matchDao.insert(matchDto);
		
		matchDto = matchDao.selectOne(matchNo);
		String homeTeam = matchDto.getHomeTeam();
		String awayTeam = matchDto.getAwayTeam();
		int matchHomeScore = matchDto.getMatchHomeScore();
		int matchAwayScore = matchDto.getMatchAwayScore();
		
		if (matchHomeScore > matchAwayScore) {
			teamDao.updateWin(homeTeam);
			teamDao.updateLose(awayTeam);
		}
		else if (matchHomeScore < matchAwayScore) {
			teamDao.updateWin(awayTeam);
			teamDao.updateLose(homeTeam);
		}
		else {
			teamDao.updateDraw(homeTeam);
			teamDao.updateDraw(awayTeam);
		}
		teamDao.updateWinRate(homeTeam);
		teamDao.updateWinRate(awayTeam);
		teamDao.updateGameGap();

		return "redirect:detail?matchNo="+matchNo;
	}
	
	@RequestMapping("/list")
	public String list(Model model) {
		List<MatchDto> list = matchDao.selectList();
		model.addAttribute("list",list);
		return "/WEB-INF/views/admin/match/list.jsp";				
	}

	@RequestMapping("/detail")
	public String detail(@RequestParam int matchNo, Model model) {
		MatchDto matchDto = matchDao.selectOne(matchNo);
		model.addAttribute("matchDto", matchDto);
		return "/WEB-INF/views/admin/match/detail.jsp";
	}
	
	@GetMapping("/change")
	public String change(Model model, @RequestParam int matchNo) {
		MatchDto matchDto = matchDao.selectOne(matchNo);
		model.addAttribute("matchDto", matchDto);
		return "/WEB-INF/views/admin/match/change.jsp";
	}
	
	@PostMapping("/change")
	public String change(@ModelAttribute MatchDto matchDto) {
		boolean result = matchDao.update(matchDto);
		if(result) {
			return "redirect:detail?matchNo="+matchDto.getMatchNo();
		}
		else {
			return "redirecr:error";
		}
	}
}
