package com.kh.baseball.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class MenuController {

	@RequestMapping("/schedule")
	public String schedule() {
		return "/WEB-INF/views/menu/schedule.jsp";
	}	
}
