package com.sp.app.lounge.controller;

import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sp.app.common.MyUtil;
import com.sp.app.common.PaginateUtil;
import com.sp.app.common.StorageService;
import com.sp.app.lounge.model.PhotoBoard;
import com.sp.app.lounge.service.PhotoBoardService;
import com.sp.app.model.SessionInfo;

import jakarta.annotation.PostConstruct;
import jakarta.servlet.http.HttpServletRequest;
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
	
	@GetMapping("{bdtype}/write")
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

	@PostMapping("{bdtype}/write")
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
	
	@GetMapping("{bdtype}/list")
	public String list(@RequestParam(name = "page", defaultValue = "1") int current_page,
			@RequestParam(name = "schType", defaultValue = "all") String schType,
			@RequestParam(name = "kwd", defaultValue = "") String kwd,
			Model model,
			HttpServletRequest req) throws Exception {
		
		try {
			int size = 10;
			int total_page = 0;
			int dataCount = 0;
			
			kwd = URLDecoder.decode(kwd, "utf-8");
			
			Map<String, Object> map = new HashMap<>();
			map.put("schType", schType);
			map.put("kwd", kwd);
			
			dataCount = service.dataCount(map);
			total_page = paginateUtil.pageCount(dataCount, size);
			
			current_page = Math.min(current_page, total_page);
			
			int offset = (current_page - 1) * size;
			if (offset < 0) offset = 0;
			
			map.put("offset", offset);
			map.put("size", size);
			
			List<PhotoBoard> list = service.listBoard(map);
			
			String cp = req.getContextPath();
			String query = "page=" + current_page;
			String listUrl = cp + "tip/";
			String articleUrl = cp + "tip/article";
			
			if (! kwd.isBlank()) {
				 String qs = "schType=" + schType + "&kwd=" + URLEncoder.encode(kwd, "utf-8");
				
				listUrl += "?" + qs;
				articleUrl += "&" + qs;
			}
			
			String paging = paginateUtil.paging(current_page, total_page, listUrl);
			
			model.addAttribute("list", list);
			
			model.addAttribute("dataCount", dataCount);
			model.addAttribute("size", size);
			model.addAttribute("page", current_page);
			model.addAttribute("total_page", total_page);
			model.addAttribute("articleUrl", articleUrl);
			model.addAttribute("paging", paging);
			
			model.addAttribute("schType", schType);
			model.addAttribute("kwd", kwd);
			model.addAttribute("query", query);
			
		} catch (Exception e) {
			log.info("list : ", e);
		}
		
		return "lounge1/{bdtype}/list";
	}

}