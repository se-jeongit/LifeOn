package com.sp.app.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequiredArgsConstructor
@Slf4j
@RequestMapping("/policy/*")
public class PolicyBoardController {

	@GetMapping("list")
	public String list() {
		
		return "policy/list";
	}
	
	
	@GetMapping("write") 
	public String writeForm() throws Exception {
		return "policy/write";
	}
	
}
