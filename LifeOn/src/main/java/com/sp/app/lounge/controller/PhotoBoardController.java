package com.sp.app.lounge.controller;

import java.io.IOException;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sp.app.common.MyUtil;
import com.sp.app.common.PaginateUtil;
import com.sp.app.common.StorageService;
import com.sp.app.lounge.model.PhotoBoard;
import com.sp.app.lounge.service.PhotoBoardService;
import com.sp.app.model.SessionInfo;

import jakarta.annotation.PostConstruct;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequiredArgsConstructor
@Slf4j
@RequestMapping("/lounge1/*")
public class PhotoBoardController {
	private final PhotoBoardService service;
	private final StorageService storageService;
	private final PaginateUtil paginateUtil;
	private final MyUtil myUtil;
	
	private String uploadPath;
	
	@PostConstruct
	public void init() {
		uploadPath = storageService.getRealPath("/uploadPath/tip");
	}
	
	@GetMapping("room")
	public String roomList(Model model) {
		
		model.addAttribute("bdtype", "room");
		
		return "lounge1/list";
	}
	
	@GetMapping("recipe")
	public String recipeList(Model model) {
		
		model.addAttribute("bdtype", "recipe");
		
		return "lounge1/list";
	}
	
	@GetMapping("write/{bdtype}")
	public String writeForm(@PathVariable(name = "bdtype") String bdtype, Model model) throws Exception {
		/*
		// 로그인 확인
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		if (info == null) {
		// 로그인하지 않은 경우: 로그인 페이지로 리다이렉트
		session.setAttribute("redirectUrl", "/lounge1/write/" + bdtype); // 리다이렉트할 URL을 세션에 저장
		return "redirect:/member/login"; // 로그인 페이지로 리다이렉트
		}
	*/
		// 로그인 상태라면 글쓰기 폼 열기
		model.addAttribute("bdtype", bdtype);
		model.addAttribute("mode", "write");
		
		return "lounge1/write"; // 글쓰기 폼 페이지 반환
	}

	@PostMapping("write/{bdtype}")
	public String writeSubmit(@PathVariable(name = "bdtype") String bdtype, PhotoBoard dto,
			HttpSession session, HttpServletRequest req) throws Exception {
		
			try {
				
		        SessionInfo info = (SessionInfo) session.getAttribute("member");
		        /*
		        if (info == null) {
		            // 로그인하지 않으면 로그인 페이지로 리다이렉트
		            session.setAttribute("redirectUrl", "/lounge1/write/" + bdtype); // 글쓰기 후 돌아올 페이지를 세션에 저장
		            return "redirect:/member/login"; // 로그인 페이지로 리다이렉트
		        }
				*/
				
		    dto.setNum(info.getNum());
			dto.setNickname(info.getNickName());
			dto.setIpaddr(req.getRemoteAddr());
			dto.setBdtype(bdtype);
			
			service.insertBoard(dto, uploadPath);
			
		} catch (Exception e) {
			log.info("writeSubmit : ", e);
		}
		
		return "redirect:/lounge1/" + bdtype;
	}

}