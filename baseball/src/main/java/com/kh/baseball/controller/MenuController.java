package com.kh.baseball.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class MenuController {

	@RequestMapping("/schedule/doosan")
	public String scheduleDoosan() {
		return "/WEB-INF/views/menu/scheduleDoosan.jsp";
	}	
	
	@RequestMapping("/schedule/lg")
	public String scheduleLg() {
		return "/WEB-INF/views/menu/scheduleLg.jsp";
	}	
	
	@RequestMapping("/reservation/doosan")
	public String reservationDoosan() {
		return "/WEB-INF/views/menu/reservationDoosan.jsp";
	}	
	
	@RequestMapping("/reservation/lg")
	public String reservationLg() {
		return "/WEB-INF/views/menu/reservationLg.jsp";
	}	
	
	@RequestMapping("/teamInfo")
	public String teamInfo() {
		return "/WEB-INF/views/menu/teamInfo.jsp";
	}	
}
