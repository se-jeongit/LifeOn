package com.sp.app.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sp.app.common.MyUtil;
import com.sp.app.common.PaginateUtil;
import com.sp.app.common.StorageService;
import com.sp.app.lounge.controller.FreeBoardController;
import com.sp.app.lounge.service.FreeBoardService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequiredArgsConstructor
@Slf4j
@RequestMapping(value = "/city/*")
public class MeetingController {
	
	@GetMapping("meeting")
	public String meetingList() throws Exception {
		return "city/meeting/list";
	}
	
	@GetMapping("write")
	public String writeForm() {
		return "city/meeting/write";
	}
}
