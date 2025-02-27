package com.sp.app.admin.controller;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.ResponseBody;

import com.sp.app.admin.service.VisitorLogService;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/admin/main/*")
@RequiredArgsConstructor
public class VisitorLogController {
	private final VisitorLogService visitorLogService;
	
		
	@GetMapping("/totalMembers")
	@ResponseBody
	public int getTotalMembers() {
		return visitorLogService.countTotalMembers();
	}
	
	@GetMapping("/todayNewMembers")
	@ResponseBody
	public int getTodayNewMembers() {
		return visitorLogService.countTodayNewMembers();
	}
	
	@GetMapping("/memberAgeDistribution")
	@ResponseBody
	public List<Map<String, Object>> MemberAgeDistribution() {
		return visitorLogService.MemberAgeDistribution();
	}
	
}
