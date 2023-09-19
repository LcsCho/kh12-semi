package com.kh.baseball.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.mail.SimpleMailMessage;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.baseball.dao.MemberDao;
import com.kh.baseball.dto.MemberDto;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/member")
public class MemberController {

	@Autowired
	private MemberDao memberDao;
	
	//회원가입
	@GetMapping("/join")
	public String join() {
		return "/WEB-INF/views/member/join.jsp";
	}
	
	@PostMapping("/join")
	public String join(@ModelAttribute MemberDto memberDto) {
		memberDao.insert(memberDto);
		return "redirect:joinFinish";
	}
	
	@RequestMapping("/joinFinish")
	public String joinFinish() {
		return "/WEB-INF/views/member/joinFinish.jsp";
	}
	
	//로그인
	@GetMapping("/login")
	public String login() {
		return "/WEB-INF/views/member/login.jsp";
	}
	
	@PostMapping("/login")
	public String login(@ModelAttribute MemberDto inputDto, HttpSession session) {
		//[1] 사용자가 입력한 아이디로 데이터베이스에서 정보를 조회
		MemberDto findDto = memberDao.selectOne(inputDto.getMemberId());
		//[2] 1번에서 정보가 있다면 비밀번호를 검사(없으면 차단)
		if(findDto == null) {
			return "redirect:login?error"; 
		}
		//입력한 비밀번호와 DB번호가 같은지 확인
		boolean isCorrectPw = inputDto.getMemberPw().equals(findDto.getMemberPw());
		
		//[3] 비밀번호가 일치하면 메인페이지로 이동(로그인에 성공)
		if(isCorrectPw) {

			//세션에 아이디+등급 저장
			session.setAttribute("id", findDto.getMemberId());
			session.setAttribute("level", findDto.getMemberLevel());
			
			//로그인시간 갱신
			memberDao.updateMemberLogin(inputDto.getMemberId());
			
			//메인페이지로 이동
			return "redirect:/"; 
		}
		
		//[4] 비밀번호가 일치하지 않으면 로그인페이지로 이동
		else {
			return "redirect:login?error";
		}
	}
	
	//-------------------------------회원 전용 메뉴
	
	//로그아웃
	@RequestMapping("/logout")
	public String logout(HttpSession session){
		//아이디+등급 삭제
		session.removeAttribute("name");
		session.removeAttribute("level");
		return "redirect:/";
	}
			
	@RequestMapping("/mypage")
	public String mypage(HttpSession session, Model model) {
		//[1] 세션에서 사용자의 아이디를 꺼낸다
		String memberId = (String) session.getAttribute("id");
		//[2] 가져온 아이디로 회원정보를 조회한다
		MemberDto memberDto = memberDao.selectOne(memberId);
		//[3] 조회한 정보를 모델에 첨부한다
		model.addAttribute("memberDto",memberDto);
		
		return "/WEB-INF/views/member/mypage.jsp";
	}
		
	//비밀번호 변경
	@GetMapping("/password")
	public String password() {
		return "/WEB-INF/views/member/password.jsp";
	}
		
	@PostMapping("/password")
	public String password(HttpSession session, 
								@RequestParam String originPw,
								@RequestParam String changePw) {
		String memberId = (String) session.getAttribute("id");
		MemberDto memberDto = memberDao.selectOne(memberId);

		//[1] 기존 비밀번호가 일치하는지 판정
		if(memberDto.getMemberPw().equals(originPw)) {//비밀번호가 일치
			
			//[2] 1번이 성공일 때만 비밀번호를 변경하도록 처리(+개인정보 변경시각 수정)
			memberDao.updateMemberPw(memberId, changePw);
			return "redirect:passwordFinish";
		}
		else {
			return "redirect:password?error";
		}
	}
	
	@RequestMapping("/passwordFinish")
	public String passwordFinish() {
		return "/WEB-INF/views/member/passwordFinish.jsp";
	}
	
	//회원 개인정보 변경
	@GetMapping("/change")
	public String change(HttpSession session, Model model) {
		//세션에서 사용자 아이디를 꺼낸다
		String memberId = (String) session.getAttribute("id");
		//가져온 아이디로 회원 정보를 조회한다
		MemberDto memberDto = memberDao.selectOne(memberId);
		//조회한 정보를 모델에 첨부한다
		model.addAttribute("memberDto",memberDto);
		return "/WEB-INF/views/member/change.jsp";
	}
	
	@PostMapping("/change")
	public String change(@ModelAttribute MemberDto inputDto,
						HttpSession session){
		String memberId = (String) session.getAttribute("id");
		//비밀번호 검사 후 변경 처리 요청
		MemberDto findDto = memberDao.selectOne(memberId);
		
		if(inputDto.getMemberPw().equals(findDto.getMemberPw())) {
			inputDto.setMemberId(memberId); //아이디 설정
			memberDao.updateMemberInfo(inputDto); //정보 변경 처리
			return "redirect:mypage";			
		}
		else{//비밀번호가 일치하지 않으면 에러페이지로 이동
			return  "redirect:change?error";
		}
	}	
	
	//회원 탈퇴
	@GetMapping("/exit")
	public String exit() {
		return "/WEB-INF/views/member/exit.jsp";
	}
	
	@PostMapping("/exit")
	public String exit(HttpSession session, @RequestParam String memberPw) {		
		String memberId = (String) session.getAttribute("id");
		MemberDto memberDto = memberDao.selectOne(memberId);
		
		if(memberDto.getMemberPw().equals(memberPw)) {//비밀번호 일치
			//회원 탈퇴 처리
			memberDao.delete(memberId);
			//로그아웃 처리
			session.removeAttribute("id"); //세션에서 id 값 삭제
			return "redirect:exitFinish";
		}
		else {//비밀번호 불일치
			return "redirect:exit?error";
		}
	}
	
	@RequestMapping("/exitFinish")
	public String exitFinish() {
		return "/WEB-INF/views/member/exitFinish.jsp";
	}
	
	//비밀번호 찾기
	@GetMapping("/findPw")
	public String findPw() {
		return "/WEB-INF/views/member/findPw.jsp";
	}
	
	@PostMapping("/findPw")
	public String findPw(@ModelAttribute MemberDto memberDto) { 
		//[1] 아이디로 모든 정보 불러오기
		MemberDto findDto = memberDao.selectOne(memberDto.getMemberId());
		//[2] 이메일이 일치하는지 확인
		boolean isValid = findDto != null //아이디가 있으며
				&& findDto.getMemberEmail().equals(memberDto.getMemberEmail()); //이메일까지 일치하는지
		if(isValid) {//이메일이 같다면
//			//이메일 발송 코드
//			SimpleMailMessage message = new SimpleMailMessage();
//			message.setTo(findDto.getMemberEmail());
//			message.setSubject("비밀번호 찾기 결과");
//			message.setText(findDto.getMemberPw());
//			sender.send(message);
			
			return "redirect:findPwFinish";
		}
		else {
			return "redirect:findPw?error";
		}
	}
	@RequestMapping("/findPwFinish")
	public String findPwFinish() {
		
		return "/WEB-INF/views/member/findPwFinish.jsp"; 	
	}
}
