package com.sp.app.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequiredArgsConstructor
@Slf4j
@RequestMapping(value = "/lounge/*")
public class FreeBoardController {
	
	@GetMapping("room")
	public String roomList() {
		return "lounge/room/list";
	}
	
	@GetMapping("recipe")
	public String recipeList() {
		return "lounge/recipe/list";
	}
	
	@GetMapping("tip")
	public String tipList() throws Exception {
		return "lounge/tip/list";
	}
	
	@GetMapping("daily")
	public String dailyList() throws Exception {
		return "lounge/daily/list";
	}
}
