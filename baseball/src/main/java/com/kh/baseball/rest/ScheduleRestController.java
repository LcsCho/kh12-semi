package com.kh.baseball.rest;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.kh.baseball.dao.MatchDao;
import com.kh.baseball.dao.MemberDao;
import com.kh.baseball.dao.SeatAreaDao;
import com.kh.baseball.dao.SeatDao;
import com.kh.baseball.dao.StadiumDao;
import com.kh.baseball.dao.TeamDao;
import com.kh.baseball.dao.TrueReservationDao;
import com.kh.baseball.dto.MatchDto;
import com.kh.baseball.dto.MemberDto;
import com.kh.baseball.dto.SeatAreaDto;
import com.kh.baseball.dto.SeatDto;
import com.kh.baseball.dto.SeatListDto;
import com.kh.baseball.dto.StadiumDto;
import com.kh.baseball.dto.TeamDto;
import com.kh.baseball.vo.MatchVO;


//CORE를 해제하기 위한 설정(Annotation)
@CrossOrigin //전부 다 허용(위험)
//@CrossOrigin(origins = {"http://192.168.30.46:5500"})
@RestController //@Controller + @ResponseBody
public class ScheduleRestController {
	
	@Autowired
	private MatchDao matchDao;
	
	@RequestMapping("/match")
	public List<MatchVO> match() {
		return matchDao.selectNoList();
	}

}

