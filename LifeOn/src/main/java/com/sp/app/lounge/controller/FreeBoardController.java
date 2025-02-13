package com.sp.app.lounge.controller;

import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Objects;

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
import com.sp.app.lounge.model.FreeBoard;
import com.sp.app.lounge.service.FreeBoardService;
import com.sp.app.model.SessionInfo;

import jakarta.annotation.PostConstruct;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequiredArgsConstructor
@Slf4j
@RequestMapping(value = "/lounge2/*")
public class FreeBoardController {
	private final FreeBoardService service;
	private final StorageService storageService;
	private final PaginateUtil paginateUtil;
	private final MyUtil myUtil;
	
	@GetMapping("daily")
	public String dailyList() throws Exception {
		return "lounge2/daily/list";
	}
	
	private String uploadPath;
	
	@PostConstruct
	public void init() {
		uploadPath = storageService.getRealPath("/uploadPath/tip");
	}
	
	@GetMapping("tip")
	public String tipList(@RequestParam(name = "page", defaultValue = "1") int current_page,
			@RequestParam(name = "schType", defaultValue = "all") String schType,
			@RequestParam(name = "kwd", defaultValue = "") String kwd,
			Model model,
			HttpServletRequest req) throws Exception {
		
		try {
			int size = 5;
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
			
			List<FreeBoard> list = service.listBoard(map);
			
			String cp = req.getContextPath();
			String query = "page=" + current_page;
			String listUrl = cp + "tip";
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
		
		return "lounge2/tip/list";
	}
	
	@GetMapping("tip/write")
	public String writeForm(Model model) throws Exception {
		model.addAttribute("mode", "write");
		return "lounge2/tip/write";
	}
	
	@PostMapping("tip/write")
	public String writeSubmit(FreeBoard dto,
			HttpSession session,HttpServletRequest req) throws Exception {
		
		try {
			SessionInfo info = (SessionInfo)session.getAttribute("member");
			
			dto.setNum(info.getNum());
			dto.setNickname(info.getNickName());
			dto.setIpaddr(req.getRemoteAddr());
			dto.setBdtype("tip");
			
			service.insertBoard(dto, uploadPath);
			
		} catch (Exception e) {
			log.info("writeSubmit : ", e);
		}
		
		return "redirect:/lounge2/tip";
	}
	
	@GetMapping("article/{psnum}")
	public String article(
			@PathVariable("psnum") long num,
			@RequestParam(name = "page") String page,
			@RequestParam(name = "schType", defaultValue = "all") String schType,
			@RequestParam(name = "kwd", defaultValue = "") String kwd,
			Model model,
			HttpSession session) throws Exception {
		
		String query = "page=" + page;
		
		try {
			kwd = URLDecoder.decode(kwd, "utf-8");
			if (! kwd.isBlank()) {
				query += "&schType=" + schType + "&kwd=" + URLEncoder.encode(kwd, "utf-8");
			}
			
			service.updateHitCount(num);
			
			FreeBoard dto = Objects.requireNonNull(service.findById(num));
			
			// 엔터를 <Br>로 // 스마트에디터 사용 중
			// dto.setContent(myUtil.htmlSymbols(dto.getContent()));
			
			Map<String, Object> map = new HashMap<>();
			map.put("schType", schType);
			map.put("kwd", kwd);
			map.put("psnum", num);
			
			FreeBoard prevDto = service.findByPrev(map);
			FreeBoard nextDto = service.findByNext(map);
			
			SessionInfo info = (SessionInfo) session.getAttribute("member");
			map.put("nickname", info.getNickName());
			boolean ismemberLiked = service.isMemberBoardLiked(map);
			
			model.addAttribute("dto", dto);
			model.addAttribute("prevDto", prevDto);
			model.addAttribute("nextDto", nextDto);
			
			model.addAttribute("ismemberLiked", ismemberLiked);

			model.addAttribute("query", query);
			model.addAttribute("page", page);
			
			return "lounge2/tip/article";
			
		} catch (NullPointerException e) {
		} catch (Exception e) {
			log.info("article : ", e);
		}
		
		return "redirect:/lounge2/tip?" + query;
	}
}
