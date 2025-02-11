package com.sp.app.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sp.app.common.StorageService;
import com.sp.app.model.PolicyBoard;
import com.sp.app.model.SessionInfo;
import com.sp.app.service.PolicyBoardService;

import jakarta.annotation.PostConstruct;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequiredArgsConstructor
@Slf4j
@RequestMapping("/policy/*")
public class PolicyBoardController {
	private final PolicyBoardService service;
	private final StorageService storageService;
	
	private String uploadPath;
	
	@PostConstruct
	public void init() {
		uploadPath = storageService.getRealPath("/uploads/policy");
	}
	
	@GetMapping("list")
	public String list() {
		
		return "policy/list";
	}
	
	
	@GetMapping("write") 
	public String writeForm(Model model) throws Exception {
		model.addAttribute("mode", "write");
		return "policy/write";
	}
	
	@PostMapping("write")
	public String writeSubmit(PolicyBoard dto, HttpSession session) throws Exception {
		try {
			SessionInfo info = (SessionInfo)session.getAttribute("member");
			if(info !=null) {
				dto.setNum(info.getNum());
			} else {
				return "redirect:/member/login";
			}
			
			
			service.insertPolicy(dto, uploadPath);
			
		} catch (Exception e) {
			log.info("writeSubmit:" , e);
		}
		
		
		return "redirect:/policy/list";
	}
	
	@GetMapping("article")
	public String article() throws Exception{
		return "policy/article";
	}
	
	@GetMapping("listReply")
	public String listReply() throws Exception {
		return "policy/listReply";
	}
}
