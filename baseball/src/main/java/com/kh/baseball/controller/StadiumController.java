package com.kh.baseball.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.baseball.dao.StadiumDao;
import com.kh.baseball.dto.StadiumDto;

@Controller
@RequestMapping("/stadium")
public class StadiumController {
	
	
	@Autowired
	private StadiumDao stadiumDao;
	
	@GetMapping("/insert")
	public String insert() {
		return "/WEB-INF/views/stadium/insert.jsp";
	}
	@PostMapping("/insert")
	public String insert(@ModelAttribute StadiumDto stadiumDto) {
	    // 1. 데이터베이스 시퀀스 값을 가져오기
	    int stadiumNo = stadiumDao.sequence();
	    
	    // 2. 가져온 시퀀스 값을 스타디움 DTO에 설정
	    stadiumDto.setStadiumNo(stadiumNo);
	    
	    // 3. 스타디움 정보를 데이터베이스에 삽입
	    stadiumDao.insert(stadiumDto);
	    
	    // 4. 삽입 완료 페이지로 리다이렉트
	    return "redirect:insertFinish";
	}
	   @RequestMapping("/insertFinish")
	   public String insertFinish() {
	      return "/WEB-INF/views/stadium/insertFinish.jsp";
	   }
}
