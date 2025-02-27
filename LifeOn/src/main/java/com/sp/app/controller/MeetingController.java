package com.sp.app.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sp.app.common.MyUtil;
import com.sp.app.common.PaginateUtil;
import com.sp.app.common.StorageService;
import com.sp.app.lounge.model.FreeBoard;
import com.sp.app.model.Meeting;
import com.sp.app.model.SessionInfo;
import com.sp.app.service.MeetingService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequiredArgsConstructor
@Slf4j
@RequestMapping(value = "/city/*")
public class MeetingController {
	private final MeetingService service;
	private final StorageService storageService;
	private final PaginateUtil paginateUtil;
	private final MyUtil myUtil;
	
	@GetMapping("meeting")
	public String meetingList() throws Exception {
		return "city/meeting/list";
	}
	
	@GetMapping("meeting/write")
	public String writeForm(Model model) throws Exception {
		model.addAttribute("mode", "write");
		return "city/meeting/write";
	}
	
	@PostMapping("meeting/write")
	public String writeSubmit(Meeting dto,
			HttpSession session,HttpServletRequest req) throws Exception {
		
		try {
			SessionInfo info = (SessionInfo)session.getAttribute("member");
			
			dto.setNum(info.getNum());
			dto.setId(info.getId());
			dto.setNickname(info.getNickName());
			dto.setIpaddr(req.getRemoteAddr());
			dto.setBdtype("meeting");
			
			service.insertBoard(dto);
			
		} catch (Exception e) {
			log.info("writeSubmit : ", e);
		}
		
		return "redirect:/city/meeting";
	}
}
