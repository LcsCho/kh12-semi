package com.kh.baseball.rest;

import java.util.List;
import java.util.Random;
import java.util.Set;
import java.util.TreeSet;

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
public class DummyRestController {
	
	
	@Autowired
	private SeatDao seatDao;
	
	@RequestMapping("/seat")
	public List<SeatDto> seat() {
		return seatDao.selectList();
	}
	
	@Autowired
	private MatchDao matchDao;
	
	@RequestMapping("/match")
	public List<MatchVO> match() {
		return matchDao.selectNoList();
	}

	@GetMapping("/matchInfo")
	public ResponseEntity<MatchDto> getMatchInfo(@RequestParam int matchNo) {
	    // matchNo를 이용하여 경기 정보를 데이터베이스에서 가져옴
	    MatchDto match = matchDao.selectOne(matchNo);

	    if (match != null) {
	        return ResponseEntity.ok(match);
	    } else {
	        return ResponseEntity.notFound().build();
	    }
	}
	
	// 좌석 구역과 좌석 번호 정보를 반환하는 API 엔드포인트
	//좌석 구역 정보를 반환하는 API 엔드포인트
	@GetMapping("/seatAreaNo")
	public ResponseEntity<List<SeatAreaDto>> getSeatNumbers() {
		List<SeatAreaDto> seatNumbers = seatAreaDao.selectList();
		return ResponseEntity.ok(seatNumbers);
	}
    
	// 좌석 번호 정보를 반환하는 API 엔드포인트
    @GetMapping("/seatNo")
    public ResponseEntity<List<SeatDto>> getSeatAreas() {
        List<SeatDto> seatAreas = seatDao.selectList();
        return ResponseEntity.ok(seatAreas);
    }
    
    @Autowired
	private SeatAreaDao seatAreaDao;
	

    @Autowired
    private StadiumDao stadiumDao;

@GetMapping("/stadium")
public ResponseEntity<List<StadiumDto>> getStadiumInfo() {
    // stadiumId를 이용하여 경기장 정보를 데이터베이스에서 가져옴
	List<StadiumDto> stadium = stadiumDao.selectList();
    return ResponseEntity.ok(stadium);
    }

		@Autowired
		private TeamDao teamDao;
		
		@Autowired
		private MemberDao memberDao;


@GetMapping("/team")
public ResponseEntity<List<TeamDto>> getTeamInfo() {
    // 팀 정보를 데이터베이스에서 가져옴
    List<TeamDto> team = teamDao.selectList();
    return ResponseEntity.ok(team);
}

@GetMapping("/member")
public ResponseEntity<MemberDto> getMemberInfo(HttpSession session) {
    // 세션에서 사용자 아이디 가져오기
    String memberId = (String) session.getAttribute("name");

    // 사용자 아이디로 회원 정보 조회
    MemberDto memberDto = memberDao.selectOne(memberId);

    if (memberDto != null) {
        return ResponseEntity.ok(memberDto);
    } else {
        return ResponseEntity.notFound().build();
    }
}


@Autowired
private TrueReservationDao trueReservationDao;

    @PostMapping("/reservation")
    public ResponseEntity<String> reservation(
        @RequestParam int matchNo,
        @RequestParam int homeTeam,
        @RequestParam int awayTeam,
        @RequestParam int stadiumNo,
        @RequestParam int seatAreaNo,
        @RequestParam int seatNo
    ) {
        // 받은 데이터를 이용하여 예매 처리 로직을 수행

    	MatchDto matchDto = matchDao.selectOne(matchNo);
    	StadiumDto stadiumDto = stadiumDao.selectOne(stadiumNo);
    	SeatAreaDto seatAreaDto = seatAreaDao.selectOne(seatAreaNo);
    	SeatListDto seatListDto = seatDao.selectOne(seatNo);
    	
    	
    	// 예매 성공 여부를 판단 (예매 실패 조건을 여기에 추가)
        boolean reservationSuccess = matchDto != null && stadiumDto != null &&
            seatAreaDto != null && seatListDto != null;

        // 예매 성공 시 응답 생성
        String responseMessage = reservationSuccess ? "예매가 성공적으로 완료되었습니다." : "예매에 실패하였습니다.";
        HttpStatus httpStatus = reservationSuccess ? HttpStatus.OK : HttpStatus.BAD_REQUEST;

        return new ResponseEntity<>(responseMessage, httpStatus);
    }
}

