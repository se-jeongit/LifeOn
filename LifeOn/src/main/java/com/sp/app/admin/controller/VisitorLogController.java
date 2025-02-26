package com.sp.app.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sp.app.admin.service.VisitorLogService;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/admin/main/*")
@RequiredArgsConstructor
public class VisitorLogController {
	private final VisitorLogService visitorLogService;
	
	// 방문 로그 추가 후 home.jsp로 이동
	@PostMapping("/log")
	public String logVisit(@RequestParam String sessionId) {
		visitorLogService.insertVisitorLog(sessionId);
		return "/main/home";
	}
	
	
}
