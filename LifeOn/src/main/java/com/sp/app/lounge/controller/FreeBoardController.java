package com.sp.app.lounge.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sp.app.lounge.model.FreeBoard;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequiredArgsConstructor
@Slf4j
@RequestMapping(value = "/lounge2/*")
public class FreeBoardController {
	
	@GetMapping("tip")
	public String tipList() throws Exception {
		return "lounge2/tip/list";
	}
	
	@GetMapping("daily")
	public String dailyList() throws Exception {
		return "lounge2/daily/list";
	}
	
	@GetMapping("tip/write")
	public String writeForm(Model model) throws Exception {
		model.addAttribute("mode", "write");
		return "lounge2/tip/write";
	}
	
	@PostMapping("tip/write")
	public String writeSubmit(FreeBoard dto,
			HttpSession session) throws Exception {
		
		try {
			
		} catch (Exception e) {
			log.info("writeSubmit : ", e);
		}
		
		return "redirect:lounge2/tip/list";
	}
}
