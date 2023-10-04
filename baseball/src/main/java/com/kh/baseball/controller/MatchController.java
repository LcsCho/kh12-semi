package com.kh.baseball.controller;

import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.util.Date;
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
import com.kh.baseball.dto.SeatDto;
import com.kh.baseball.dto.StadiumDto;
import com.kh.baseball.dto.TeamDto;
import com.kh.baseball.vo.PaginationVO;
@Repository
//잠시 admin 뺐음

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
	public String insert(@ModelAttribute MatchDto matchDto, @RequestParam("matchDto.matchDateStr") String matchDateStr) {
		// 전달된 정보로 검사 후 차단 코드 추가
		String subStrMatchDate = matchDateStr.substring(0, 10);
		if(matchDao.checkDuplicate(matchDto, subStrMatchDate)) {
			return "redirect:insertError";
		}
		
		int matchNo = matchDao.sequence();
		matchDto.setMatchNo(matchNo);
		
	    // matchDateStr을 Timestamp로 변환
	    try {
	        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm");
	        Date parsedDate = dateFormat.parse(matchDateStr);

	        // java.util.Date를 java.sql.Timestamp으로 변환
	        java.sql.Timestamp timestamp = new java.sql.Timestamp(parsedDate.getTime());

	        matchDto.setMatchDate(timestamp);
	    } catch (ParseException e) {
	        // 예외 처리 로직 추가
	    }
		
		matchDao.insertMatch(matchDto);

		return "redirect:detailMatch?matchNo="+matchNo;
	}
	
	@RequestMapping("/insertError") 
		public String insertError() {
		return "/WEB-INF/views/admin/match/insertError.jsp";
	}
	
	@GetMapping("/updateDate")
	public String updateDate(Model model, @RequestParam int matchNo) {
		MatchDto matchDto = matchDao.selectOne(matchNo);
		model.addAttribute("matchDto", matchDto);
		
		return "/WEB-INF/views/admin/match/updateDate.jsp";
	}
	
	@PostMapping("/updateDate")
	public String updateDate(@ModelAttribute MatchDto matchDto, @RequestParam("matchDto.matchDateStr") String matchDateStr) {
		// matchDateStr을 Timestamp로 변환
	    try {
	        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm");
	        Date parsedDate = dateFormat.parse(matchDateStr);

	        // java.util.Date를 java.sql.Timestamp으로 변환
	        java.sql.Timestamp timestamp = new java.sql.Timestamp(parsedDate.getTime());

	        matchDto.setMatchDate(timestamp);
	    } catch (ParseException e) {
	        // 예외 처리 로직 추가
	    }
		
		matchDao.updateDate(matchDto);
		return "redirect:detailMatch?matchNo="+matchDto.getMatchNo();
	}
	
	@GetMapping("/updateScore")
	public String updateMatch(Model model,
			@RequestParam int matchNo) {
		MatchDto matchDto = matchDao.selectOne(matchNo);
		model.addAttribute("matchDto", matchDto);
		
		return "/WEB-INF/views/admin/match/updateScore.jsp";
	}
	
	
	
	@PostMapping("/updateScore")
	public String updateMatch(@ModelAttribute MatchDto matchDto) {
		matchDao.update(matchDto);

		return "redirect:detailMatch?matchNo="+matchDto.getMatchNo();
	}
	
	@GetMapping("/insertResult")
	public String insertResult(Model model,
			@RequestParam int matchNo) {
		MatchDto matchDto = matchDao.selectOne(matchNo);
		model.addAttribute("matchDto", matchDto);
		
		return "/WEB-INF/views/admin/match/insertResult.jsp";
	}
	
	@PostMapping("/insertResult")
	public String insertResult(@ModelAttribute MatchDto matchDto) {
		//match 종료시 스코어 업데이트 하면 좌석 상태를 다 Y로 만드는 절
		matchDao.seatStatusUpdateByMatchFinish(matchDto.getMatchNo());
		
		matchDao.update(matchDto);
		
		int matchNo = matchDto.getMatchNo();
		matchDto = matchDao.selectOne(matchNo);
		String homeTeam = matchDto.getHomeTeam();
		String awayTeam = matchDto.getAwayTeam();
		int matchHomeScore = matchDto.getMatchHomeScore();
		int matchAwayScore = matchDto.getMatchAwayScore();
		
		if (matchHomeScore > matchAwayScore) {
			teamDao.updateWin(homeTeam);
			teamDao.updateLose(awayTeam);
			teamDao.updateSequenceWin(homeTeam);
			teamDao.updateSequenceLose(awayTeam);
		}
		else if (matchHomeScore < matchAwayScore) {
			teamDao.updateWin(awayTeam);
			teamDao.updateLose(homeTeam);
			teamDao.updateSequenceWin(awayTeam);
			teamDao.updateSequenceLose(homeTeam);
			
		}
		else {
			teamDao.updateDraw(homeTeam);
			teamDao.updateDraw(awayTeam);
			teamDao.updateSequenceDraw(homeTeam);
			teamDao.updateSequenceDraw(awayTeam);
		}
		teamDao.updateWinRate(homeTeam);
		teamDao.updateWinRate(awayTeam);
		teamDao.updateGameGap();

		return "redirect:detailMatch?matchNo="+matchNo;
	}
	
	@RequestMapping("/list")
	public String list(@ModelAttribute(name="vo") PaginationVO vo,Model model) {
		int count = matchDao.countList(vo);
		vo.setCount(count);
		
		
		List<MatchDto> list = matchDao.selectList(vo);
		LocalDateTime now = LocalDateTime.now();
		Timestamp timestamp = Timestamp.valueOf(now);
		model.addAttribute("now", timestamp);
		
		//pagination
		
		
		model.addAttribute("list",list);
		return "/WEB-INF/views/admin/match/list.jsp";				
	}

	

	@RequestMapping("/detailMatch")
	public String detailMatch(@RequestParam int matchNo, Model model) {
		MatchDto matchDto = matchDao.selectOne(matchNo);
		LocalDateTime now = LocalDateTime.now();
		Timestamp timestamp = Timestamp.valueOf(now);
		model.addAttribute("now", timestamp);
		model.addAttribute("matchDto", matchDto);
		return "/WEB-INF/views/admin/match/detailMatch.jsp";
	}
	
//	@RequestMapping("/detailMatchResult")
//	public String detailMatchResult(@RequestParam int matchNo, Model model) {
//		MatchDto matchDto = matchDao.selectOne(matchNo);
//		model.addAttribute("matchDto", matchDto);
//		return "/WEB-INF/views/admin/match/detailMatch.jsp";
//	}
	
}
