package com.sp.app.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sp.app.admin.service.VisitorCounter;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequiredArgsConstructor
@Slf4j
public class HomeManageController {
	private final VisitorCounter visitorCounter;
	
	@GetMapping("/admin")
	public String handleHome() {
		return "admin/main/home";
	}
	
	//누적 방문자 수 반환
	@GetMapping("/admin/main/totalVisitors")
	@ResponseBody
	public int getTotalVisitors() {
		return visitorCounter.getTotalVisitorCount();
	}
	
	//오늘 방문자 수 반환 
	@GetMapping("/admin/main/todayVisitors")
	@ResponseBody
	public int getTodayVisitors() {
		return visitorCounter.getTodayVisitorCount();
	}
	
	
}
