package com.sp.app.controller;

import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sp.app.common.MyUtil;
import com.sp.app.common.PaginateUtil;
import com.sp.app.common.StorageService;
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
@RequestMapping(value = "/city/meeting/*")
public class MeetingController {
	private final MeetingService service;
	private final StorageService storageService;
	private final PaginateUtil paginateUtil;
	
	
	@GetMapping("main")
	public String MeetingList(
			@RequestParam(name = "cbn", defaultValue = "0") long categoryNum,
			@RequestParam(name = "page", defaultValue = "1") int current_page,
			@RequestParam(name = "schType", defaultValue = "all") String schType,
			@RequestParam(name = "kwd", defaultValue = "") String kwd,
			Model model,
			HttpServletRequest req) throws Exception {
		
		try {
			int size = 10;
			int total_page = 0;
			int dataCount = 0;
			
			kwd = URLDecoder.decode(kwd, "utf-8");
			
			List<Meeting> listCategory = service.listCategory(); 
			
			
			Map<String, Object> map = new HashMap<>();
			map.put("cbn", categoryNum);
			map.put("schType", schType);
			map.put("kwd", kwd);
			
			dataCount = service.dataCount(map);
			if (dataCount != 0) {
				total_page = paginateUtil.pageCount(dataCount, size);
			}
			
			total_page = paginateUtil.pageCount(dataCount, size);
			current_page = Math.min(current_page, total_page);
			
			int offset = (current_page - 1) * size;
			if (offset < 0) offset = 0;
			
			map.put("offset", offset);
			map.put("size", size);
			
			List<Meeting> list = service.listBoard(map);
			
			String cp = req.getContextPath();
			
			String listUrl = cp + "/city/meeting/main";
			String articleUrl = cp + "/city/meeting/article/" + "?page=" + current_page;
			
			String query = "cbn=" + categoryNum;
			
			if (! kwd.isBlank()) {
				 String qs = "schType=" + schType + "&kwd=" + URLEncoder.encode(kwd, "utf-8");
				
				listUrl += "?" + qs;
				query += "&" + qs;
			}
			
			String paging = paginateUtil.paging(current_page, total_page, listUrl);
			
			model.addAttribute("listCategory", listCategory);
			model.addAttribute("list", list);
			model.addAttribute("dataCount", dataCount);
			model.addAttribute("size", size);
			
			model.addAttribute("page", current_page);
			model.addAttribute("total_page", total_page);
			model.addAttribute("articleUrl", articleUrl);
			model.addAttribute("paging", paging);
			
			model.addAttribute("cbn", categoryNum);
			model.addAttribute("query", query);
			
			model.addAttribute("schType", schType);
			model.addAttribute("kwd", kwd);
			
		} catch (Exception e) {
			log.info("MeetingList : ", e);
		}
		
		return "city/meeting/main";
	}
	
	@GetMapping("write")
	public String writeForm(Model model) throws Exception {
		
		List<Meeting> Category = service.listCategory();
		
		model.addAttribute("mode", "write");
		model.addAttribute("Category", Category);
		
		return "city/meeting/write";
	}
	
	@PostMapping("write")
	public String writeSubmit(Meeting dto, Model model,
			HttpSession session,HttpServletRequest req) throws Exception {
		
		try {
			SessionInfo info = (SessionInfo)session.getAttribute("member");
			
			dto.setNum(info.getNum());
			dto.setId(info.getId());
			dto.setNickname(info.getNickName());
			dto.setIpaddr(req.getRemoteAddr());
			
			service.insertBoard(dto);
			
		} catch (Exception e) {
			log.info("writeSubmit : ", e);
		}
		
		return "redirect:/city/meeting/main";
	}
}
