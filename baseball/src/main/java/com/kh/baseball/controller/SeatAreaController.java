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

import com.kh.baseball.dao.SeatAreaDao;
import com.kh.baseball.dao.StadiumDao;
import com.kh.baseball.dto.SeatAreaDto;
import com.kh.baseball.dto.StadiumDto;

@Controller
@RequestMapping("/admin/seatArea")
public class SeatAreaController {
	
	@Autowired
	private SeatAreaDao seatAreaDao;
	
	@Autowired
	private StadiumDao stadiumDao;
	
	@GetMapping("/insert")
	public String insert(@ModelAttribute StadiumDto stadiumDto, Model model) {
	 	List<StadiumDto> list = stadiumDao.selectList();
		 model.addAttribute("list", list);
		return "/WEB-INF/views/admin/seatArea/insert.jsp";
	}
	
	@PostMapping("/insert")
	public String insert(@ModelAttribute SeatAreaDto seatAreaDto) {
		int seatAreaNo = seatAreaDao.sequenceSeatArea();
		seatAreaDto.setSeatAreaNo(seatAreaNo);
		seatAreaDao.insert(seatAreaDto);
		return "redirect:insertFinish";
	}
	
	@RequestMapping("/insertFinish")
	public String insertFinish() {
		return "/WEB-INF/views/admin/seatArea/insertFinish.jsp";
	}
	
	@RequestMapping("/list")
	public String list(@ModelAttribute SeatAreaDto seatAreaDto, Model model) {
		List<SeatAreaDto> list = seatAreaDao.selectList();
		model.addAttribute("list", list);
		
		return "/WEB-INF/views/admin/seatArea/list.jsp";
	}
	
	@RequestMapping("/detail")
	public String detail(@RequestParam int seatAreaNo,
			Model model) {
		SeatAreaDto seatAreaDto = seatAreaDao.selectOne(seatAreaNo);
		model.addAttribute("seatAreaDto", seatAreaDto);
		return "/WEB-INF/views/admin/seatArea/detail.jsp";
	}
	
	@GetMapping("/update")
	public String update(@RequestParam int seatAreaNo, Model model) {
		SeatAreaDto seatAreaDto = seatAreaDao.selectOne(seatAreaNo);
		model.addAttribute("seatAreaDto", seatAreaDto);
		return "/WEB-INF/views/admin/seatArea/update.jsp";
	}
	
	@PostMapping("/update")
	public String change(@ModelAttribute SeatAreaDto seatAreaDto) {
		boolean result = seatAreaDao.update(seatAreaDto);
		if (result) return "redirect:detail?teamNo=" + seatAreaDto.getSeatAreaNo();
		else return "redirect:update?error";
	}
	
	@RequestMapping("/delete")
	public String delete(@RequestParam int seatAreaNo) {
		boolean result = seatAreaDao.delete(seatAreaNo);
		if (result) return "redirect:list";
		else return "redirect:detail?error";
	}
}
