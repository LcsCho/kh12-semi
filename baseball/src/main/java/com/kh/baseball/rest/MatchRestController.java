package com.kh.baseball.rest;

import java.sql.Timestamp;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.kh.baseball.dao.MatchDao;
import com.kh.baseball.dto.MatchDto;

@CrossOrigin
@RestController
@RequestMapping("/rest/match")
public class MatchRestController {

	@Autowired
	private MatchDao matchDao;
		
	@PostMapping("/matchCheck")
	public String matchCheck(
	    @RequestParam Timestamp matchDate, 
	    @RequestParam String homeTeam, 
	    @RequestParam String awayTeam, 
	    @RequestParam String stadiumName
	) 
	{
	    List<MatchDto> list = matchDao.selectDate(matchDate);
	    boolean isDuplicate = false;

	    for (MatchDto matchDto : list) {
	        if (matchDto.getHomeTeam().equals(homeTeam) || 
	        		matchDto.getAwayTeam().equals(homeTeam) ||
	        		matchDto.getHomeTeam().equals(awayTeam) ||
	            matchDto.getAwayTeam().equals(awayTeam) ||
	            matchDto.getStadiumName().equals(stadiumName)) {
	            isDuplicate = true;
	            break; // 중복이 발견되면 반복문을 종료합니다.
	        }
	    }
	    if (isDuplicate) return "N"; // 중복된 경우
	    else return "Y"; // 중복이 없는 경우
	}
	
}
