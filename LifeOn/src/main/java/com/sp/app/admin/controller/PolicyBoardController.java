package com.sp.app.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequiredArgsConstructor
@Slf4j
public class PolicyBoardController {

	@GetMapping("/policy")
	public String handlepolicy() {
		
		return "policy/list";
	}
	
}
