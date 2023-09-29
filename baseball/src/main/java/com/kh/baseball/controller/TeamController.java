package com.kh.baseball.controller;

import java.io.File;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.util.List;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ByteArrayResource;
import org.springframework.http.ContentDisposition;
import org.springframework.http.HttpHeaders;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.kh.baseball.dao.AttachDao;
import com.kh.baseball.dao.TeamDao;
import com.kh.baseball.dto.AttachDto;
import com.kh.baseball.dto.TeamDto;
import com.kh.baseball.vo.TeamVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/admin/team")
public class TeamController {
	
	@Autowired
	private TeamDao teamDao;
	
	@Autowired
	private AttachDao attachDao;
	
	@RequestMapping("/list")
	public String list(@ModelAttribute TeamDto teamDto, Model model) {
		List<TeamDto> list = teamDao.selectList();
		List<TeamVO> voList = teamDao.recent10GamesList();
		
		model.addAttribute("list", list);
		model.addAttribute("voList", voList);
		
		return "/WEB-INF/views/admin/team/list.jsp";
	}
	
	@RequestMapping("/detail")
	public String detail(@RequestParam int teamNo,
			Model model) {
		TeamDto teamDto = teamDao.selectOne(teamNo);
		model.addAttribute("teamDto", teamDto);
		return "/WEB-INF/views/admin/team/detail.jsp";
	}
	
	@GetMapping("/register")
	public String register() {
		return "/WEB-INF/views/admin/team/register.jsp";
	}
	
	@PostMapping("/register")
	public String register(
			@ModelAttribute TeamDto teamDto, 
			@RequestParam MultipartFile attach) throws IllegalStateException, IOException {
		int teamNo = teamDao.sequenceTeam();
		teamDto.setTeamNo(teamNo);
		teamDao.insert(teamDto);
		
		if(!attach.isEmpty()) {		
		int attachNo = attachDao.sequence();
		
		String home = System.getProperty("user.home");
		File dir = new File(home, "teamlogo");
		dir.mkdirs();
		File target = new File(dir, String.valueOf(attachNo));
		attach.transferTo(target);

		AttachDto attachDto = new AttachDto();
		attachDto.setAttachNo(attachNo);
		attachDto.setAttachName(attach.getOriginalFilename());
		attachDto.setAttachSize(attach.getSize());
		attachDto.setAttachType(attach.getContentType());
		attachDao.insert(attachDto);
		
		teamDao.connect(teamNo, attachNo);
		}
		
		return "redirect:registerFinish";
	}
	
	@ResponseBody
	@RequestMapping("/image")
	public ResponseEntity<ByteArrayResource> image (@RequestParam int teamNo) throws IOException {

		AttachDto attachDto = teamDao.findImage(teamNo);
		if(attachDto == null) {
			return ResponseEntity.notFound().build();//404반환
		}

		String home = System.getProperty("user.home");
		File dir = new File(home, "teamlogo");
		File target = new File(dir, String.valueOf(attachDto.getAttachNo()));
		
		byte[] data = FileUtils.readFileToByteArray(target);
		ByteArrayResource resource = new ByteArrayResource(data);
		
		return ResponseEntity.ok()
				.header(HttpHeaders.CONTENT_ENCODING, StandardCharsets.UTF_8.name())
				.contentLength(attachDto.getAttachSize())
				.header(HttpHeaders.CONTENT_TYPE, attachDto.getAttachType())
				.header(HttpHeaders.CONTENT_DISPOSITION, 
						ContentDisposition.attachment()
						.filename(attachDto.getAttachName(), StandardCharsets.UTF_8).build().toString())
				.body(resource);
	}
	
	
	@RequestMapping("/registerFinish")
	public String registerFinish() {
		return "/WEB-INF/views/admin/team/registerFinish.jsp";
	}
	
	@GetMapping("/update")
	public String update(@RequestParam int teamNo, Model model) {
		TeamDto teamDto = teamDao.selectOne(teamNo);
		model.addAttribute("teamDto", teamDto);
		return "/WEB-INF/views/admin/team/update.jsp";
	}
	
	@PostMapping("update")
	public String change(@ModelAttribute TeamDto teamDto) {
		boolean result = teamDao.update(teamDto);
		if (result) return "redirect:detail?teamNo=" + teamDto.getTeamNo();
		else return "redirect:update?error";
	}
	
	@RequestMapping("/delete")
	public String delete(@RequestParam int teamNo) {
		boolean result = teamDao.delete(teamNo);
		if (result) return "redirect:list";
		else return "redirect:detail?error";
	}
	
	
}
