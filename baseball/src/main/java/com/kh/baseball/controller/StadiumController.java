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

import com.kh.baseball.dao.StadiumDao;
import com.kh.baseball.dto.StadiumDto;


@Controller
@RequestMapping("/admin/stadium")
public class StadiumController {
	
	
	@Autowired
	private StadiumDao stadiumDao;
	
	@GetMapping("/insert")
	public String insert() {
		return "/WEB-INF/views/admin/stadium/insert.jsp";
	}
	@PostMapping("/insert")
	public String insert(@ModelAttribute StadiumDto stadiumDto) {
	    // 1. 데이터베이스 시퀀스 값을 가져오기
	    int stadiumNo = stadiumDao.sequenceStadium();
	    
	    //좌석번호 
	    //그 좌석 번호에대한 메소드가 
	    
	    // 2. 가져온 시퀀스 값을 스타디움 DTO에 설정
	    stadiumDto.setStadiumNo(stadiumNo);
	    
	    // 3. 스타디움 정보를 데이터베이스에 삽입
	    stadiumDao.insert(stadiumDto);
	    
	    // 4. 삽입 완료 페이지로 리다이렉트
	    return "redirect:insertFinish";
	}
	   @RequestMapping("/insertFinish")
	   public String insertFinish() {
	      return "/WEB-INF/views/admin/stadium/insertFinish.jsp";
	   }
	   
	   @RequestMapping("/list")
	   public String list(@ModelAttribute StadiumDto stadiumDto, Model model) {
		   List<StadiumDto> list = stadiumDao.selectList();
		   model.addAttribute("list", list);
		   
		   return "/WEB-INF/views/admin/stadium/list.jsp";
	   }
	   
	   @RequestMapping("/detail")
	   public String detail(@RequestParam int stadiumNo, Model model) {
		   StadiumDto stadiumDto = stadiumDao.selectOne(stadiumNo);
		   model.addAttribute("stadiumDto", stadiumDto);
		   return "/WEB-INF/views/admin/stadium/detail.jsp";
	   }
}
