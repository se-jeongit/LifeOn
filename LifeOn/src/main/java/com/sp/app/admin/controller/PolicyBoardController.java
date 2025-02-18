package com.sp.app.admin.controller;

import java.net.URI;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Objects;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
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
	
	@PostConstruct // 생성자 호출후 한번 실행 
	public void init() {
		// 파일을 저장할 실제 경로
		uploadPath = storageService.getRealPath("/uploads/policy");
	}
	
	@GetMapping("list")
	public String list(
			@RequestParam(name = "page", defaultValue = "1") int current_page,
			@RequestParam(name = "schType", defaultValue = "all") String schType,
			@RequestParam(name = "kwd", defaultValue = "") String kwd,
			Model model,
			HttpServletRequest req, HttpSession session) throws Exception {
		
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
			
			List<PolicyBoard> list = service.listBoard(map);
			
			String cp = req.getContextPath();
			String query = "page=" + current_page;
			String listUrl = cp + "/policy/list";
			
			if(! kwd.isBlank()) {
				String qs  = "schType=" + schType + "&kwd=" +
						URLEncoder.encode(kwd, "utf-8");

				listUrl += "?" + qs;
				query += "&"  + qs;
				
			}
			
			String paging = paginateUtil.paging(current_page, total_page, listUrl);
			
			model.addAttribute("list", list);
			model.addAttribute("dataCount", dataCount);
			model.addAttribute("size", size);
			model.addAttribute("page", current_page);
			model.addAttribute("total_page", total_page);
			model.addAttribute("query", query);
			model.addAttribute("paging", paging);
			
			model.addAttribute("schType", schType);
			model.addAttribute("kwd", kwd);				
			
			
			
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
			
			dto.setUserId(info.getId());
			
			service.insertBoard(dto, uploadPath);
			
		} catch (Exception e) {
			log.info("writeSubmit: ", e);
		}
		return "redirect:/policy/list";
	}
	
	@GetMapping("article/{psnum}")
	public String article(
			@PathVariable("psnum") long psnum,
			@RequestParam(name = "page",  required = false, defaultValue = "1") String page,
			@RequestParam(name = "schType", defaultValue = "all") String schType,
			@RequestParam(name = "kwd", defaultValue = "") String kwd,
			Model model,
			HttpSession session) throws Exception {
		
		String query = "page=" + page;
		
		try {
			kwd = URLDecoder.decode(kwd, "utf-8");
			if(! kwd.isBlank()) {
				query += "$schType=" + schType + "&kwd="
						+ URLEncoder.encode(kwd, "utf-8");
			}
			
			//조회수 
			service.updateHitCount(psnum);
			
			//게시글 가져오기
			PolicyBoard dto = Objects.requireNonNull(service.findById(psnum));
			
			Map<String, Object> map = new HashMap<>();
			map.put("schType", schType);
			map.put("kwd", kwd);
			map.put("psnum", psnum);
			
			PolicyBoard prevDto = service.findByPrev(map);
			PolicyBoard nextDto = service.findByNext(map);
			
			model.addAttribute("dto", dto);
			model.addAttribute("prevDto", prevDto);
			model.addAttribute("nextDto", nextDto);
			
			
			model.addAttribute("query", query);
			model.addAttribute("page", page);
			
		
			
			return "policy/article";
		} catch (NullPointerException e) {
		} catch (Exception e) {
			log.info("article : ", e);
		}
		
		
		return "redirect:/policy/list?" + query;	
	
	}
	
	@GetMapping("update")
	public String updateForm(
			@RequestParam(name="psnum") long psnum,
			@RequestParam(name= "page") String page,
			Model model,
			HttpSession session) throws Exception {
		try {
			SessionInfo info = (SessionInfo) session.getAttribute("member");
			
			PolicyBoard dto = Objects.requireNonNull(service.findById(psnum));
		
			if(! info.getId().equals(dto.getUserId())) {
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
	public String updateSubmit(PolicyBoard dto,
			@RequestParam(name ="page") String page) {
		
		try {
			service.updateBoard(dto, page);
			
		} catch (Exception e) {
			log.info("updateSubmit:", e);
		}
		
		return "redirect:/policy/list?page=" + page;
	}
	
	@GetMapping("deleteFile")
	public String deleteFile(@RequestParam(name="psnum") long psnum,
			@RequestParam(name="page") String page,
			HttpSession session) {
		try {
			SessionInfo info = (SessionInfo)session.getAttribute("member");
			PolicyBoard dto = Objects.requireNonNull(service.findById(psnum));
			
			if(! info.getId().equals(dto.getUserId())) {
				return "redirect:policy/list?page=" + page;
			}
			
			if(dto.getSavefilename() != null) {
				service.deleteUploadFile(uploadPath, dto.getSavefilename());
				
				dto.setSavefilename("");
				dto.setOriginalfilename("");
				service.updateBoard(dto, uploadPath);
			}
			
			return "redirect:/policy/update?psnum=" + psnum + "&page=" + page;
		} catch (NullPointerException e) {
		} catch (Exception e) {
			log.info("deleteFile : ", e);
		}
		return "redirect:/policy/list?page=" + page;
	}
	
	@GetMapping("delete")
	public String deleteBoard(@RequestParam(name="psnum") long psnum, 
			@RequestParam(name= "schType", defaultValue="all") String schType,
			@RequestParam(name= "kwd", defaultValue = "") String kwd, 
			@RequestParam(name= "page") String page,
			HttpSession session) {
		
		String query = "page=" + page;
		
		try {
			kwd=URLDecoder.decode(kwd, "utf-8");
			if(! kwd.isBlank()) {
				query += "&schType=" + schType + "&kwd="
						+ URLEncoder.encode(kwd,"utf-8");
			}
			SessionInfo info = (SessionInfo)session.getAttribute("member");
			service.deleteBoard(psnum, uploadPath, info.getId(), info.getGrade());
		} catch (Exception e) {

		}
		return "redirect:/policy/list?" + query;
	
	}
	
	@GetMapping("download")
	public ResponseEntity<?> download(
			@RequestParam(name ="psnum") long psnum,
			HttpServletRequest req) throws Exception {
		
		try {
			PolicyBoard dto = Objects.requireNonNull(service.findById(psnum));
			
			return storageService.downloadFile(uploadPath, dto.getSavefilename(), dto.getOriginalfilename());
			
		} catch (NullPointerException e) {
		} catch (Exception e) {
			log.info("download", e);
		}
		
		String url = req.getContextPath() + "/policy/downloadFailed";
		
		return ResponseEntity
				.status(HttpStatus.FOUND)
				.location(URI.create(url))
				.build();
	}
	
	@GetMapping("downloadFailed")
	public String downloadFailed() {
		return "error/downloadFailure";
	}
	
	
	
}
