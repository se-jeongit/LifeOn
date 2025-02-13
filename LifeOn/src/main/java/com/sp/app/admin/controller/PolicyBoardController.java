package com.sp.app.admin.controller;

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
import com.sp.app.model.PolicyBoard;
import com.sp.app.model.PolicyBoardFile;
import com.sp.app.model.SessionInfo;
import com.sp.app.service.PolicyBoardService;

import jakarta.annotation.PostConstruct;
import jakarta.servlet.http.HttpServletRequest;
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
	private final PaginateUtil paginateUtil;
	private final MyUtil myUtil;
	
	private String uploadPath;
	
	@PostConstruct
	public void init() {
		uploadPath = storageService.getRealPath("/uploads/policy");
	}
	
	@GetMapping("list")
	public String list(
			@RequestParam(name = "page", defaultValue = "1") int current_page,
			@RequestParam(name = "schType", defaultValue = "all") String schType,
			@RequestParam(name = "kwd", defaultValue = "") String kwd,
			Model model,
			HttpServletRequest req) throws Exception{
		
		
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
				
				int offset = (current_page -1) * size;
				if(offset < 0) offset = 0;
				
				map.put("offset", offset);
				map.put("size", size);
				
				List<PolicyBoard> list = service.listPolicy(map);
				
				String cp = req.getContextPath();
				String query = "page=" + current_page;
				String listUrl = cp + "/policy/list";
				String articleUrl = cp + "/policy/article";
				
				if(! kwd.isBlank()) {
					String qs = "schType=" + schType + "&kwd=" + 
								URLEncoder.encode(kwd, "utf-8");
					
					listUrl += "?" + qs;
					query += "&" + qs;
					
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
	
	@GetMapping("article/{psnum}")
	public String article(
			@PathVariable("psnum") long num,
			@RequestParam(name = "page") String page,
			@RequestParam(name = "schType", defaultValue = "all") String schType,
			@RequestParam(name = "kwd", defaultValue = "") String kwd,
			Model model,
			HttpSession session) throws Exception{
		
		String query = "page=" + page;
		
		try {
			kwd = URLDecoder.decode(kwd, "utf-8");
			if(! kwd.isBlank()) {
				query += "&schType=" + schType + "&kwd="
						+ URLEncoder.encode(kwd, "utf-8");
			}
			
			service.updateHitCount(num);
			
			PolicyBoard dto = Objects.requireNonNull(service.findById(num));
			
			model.addAttribute("dto", dto);
			
			Map<String, Object> map = new HashMap<>();
			map.put("schType", schType);
			map.put("kwd", kwd);
			map.put("num", num);
			
			PolicyBoard prevDto = service.findByPrev(map);
			PolicyBoard nextDto = service.findByNext(map);
			
			model.addAttribute("prevDto", prevDto);
			model.addAttribute("nextDto", nextDto);
			model.addAttribute("page", page);
			model.addAttribute("query", query);
			
			return "policy/article";
			
		} catch (NullPointerException e) {
		} catch (Exception e) {
			log.info("article : ", e);
		}
		
		return "redirect:/policy/list?" + query;
	}
	@GetMapping("deleteFile")
	public String deleteFile(@RequestParam(name = "fnum") long num, 
			@RequestParam(name="page") String page, 
			HttpSession session) {
		try {
			SessionInfo info = (SessionInfo)session.getAttribute("member");
			PolicyBoard dto = Objects.requireNonNull(service.findById(num));
			
			if(info.getNum() != dto.getPsnum()) {
				return "redirect:/policy/list?page=" + page;
			}
			if(dto.getSaveFilename() != null) {
				service.deleteUploadFile(uploadPath, dto.getSaveFilename());
				
				dto.setSaveFilename("");
				dto.setOriginalFilename("");
			}
			return "redirect:/policy/list";
		} catch (NullPointerException e) {
		} catch (Exception e) {
			log.info("deleteFile : ", e);
		}
		return "redirect:/policy/list?page=" + page;
	}
	
	@GetMapping("delete")
	public String deletePolicy(@RequestParam(name="psnum") long num,
			@RequestParam(name="schType", defaultValue = "all") String schType,
			@RequestParam(name="kwd", defaultValue = "") String kwd,
			@RequestParam(name="page") String page, 
			HttpSession session) {
		
		String query = "page=" + page;
		
		try {
			kwd=URLDecoder.decode(kwd, "utf-8");
			if(! kwd.isBlank()) {
				query += "&schType=" + schType + "&kwd="
						+ URLEncoder.encode(kwd, "utf-8");
			}
			SessionInfo info = (SessionInfo)session.getAttribute("member");
			service.deletePolicy(num, uploadPath, info.getId(), info.getGrade());
		} catch (Exception e) {

		}
		return "redirect:/policy/list?" + query;
	}
	
	@GetMapping("update")
	public String updateForm(
			@RequestParam(name="psnum") long num,
			@RequestParam(name="page") String page,
			Model model,
			HttpSession session) throws Exception {
		try {
			SessionInfo info = (SessionInfo) session.getAttribute("member");
			
			PolicyBoard dto = Objects.requireNonNull(service.findById(num));
			
			if(info.getNum() != dto.getPsnum()) {
				return "redirect:/policy/list?page=" + page;
			}
			
			model.addAttribute("dto", dto);
			model.addAttribute("page", page);
			model.addAttribute("mode", "update");
			
			return "policy/write";
			
		} catch (NullPointerException e) {
		} catch (Exception e) {
			log.info("updateForm : ", e);
		}
		return "redirect:/policy/list?page=" + page;
		
	}
	
	@PostMapping("update")
	public String updateSubmit(PolicyBoard dto, PolicyBoardFile dtos,
			@RequestParam(name="page") String page) {
		
		try {
			service.updatePolicy(dto, dtos, uploadPath);
		} catch (Exception e) {
			log.info("updateSubmit:" , e);
		}
		
		return "redirect:/policy/list?page=" + page;
	}
	
	@GetMapping("listReply")
	public String listReply() throws Exception {
		return "policy/listReply";
	}
}
