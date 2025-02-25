package com.sp.app.rent.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequiredArgsConstructor
@Slf4j
@RequestMapping(value = "/market/rent/*")
public class RentController {
	
	@GetMapping("list")
	public String dailyList() throws Exception {
		
		return "market/rent/list";
	}
}
