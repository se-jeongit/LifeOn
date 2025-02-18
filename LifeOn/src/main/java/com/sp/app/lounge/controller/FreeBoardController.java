package com.sp.app.lounge.controller;

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
			dto.setId(info.getId());
			dto.setNickname(info.getNickName());
			dto.setIpaddr(req.getRemoteAddr());
			dto.setBdtype("tip");
			
			service.insertBoard(dto, uploadPath);
			
		} catch (Exception e) {
			log.info("writeSubmit : ", e);
		}
		
		return "redirect:/lounge2/tip";
	}
	
	@GetMapping("tip/article/{psnum}")
	public String article(
			@PathVariable(name = "psnum") long num,
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
			
			dto.setContent(myUtil.htmlSymbols(dto.getContent()));
			
			Map<String, Object> map = new HashMap<>();
			map.put("schType", schType);
			map.put("kwd", kwd);
			map.put("psnum", num);
			
			FreeBoard prevDto = service.findByPrev(map);
			FreeBoard nextDto = service.findByNext(map);
			
			// SessionInfo info = (SessionInfo) session.getAttribute("member");
			// map.put("nickname", info.getNickName());
			// boolean ismemberLiked = service.isMemberBoardLiked(map);
			
			model.addAttribute("dto", dto);
			model.addAttribute("prevDto", prevDto);
			model.addAttribute("nextDto", nextDto);
			
			// model.addAttribute("ismemberLiked", ismemberLiked);

			model.addAttribute("query", query);
			model.addAttribute("page", page);
			
			return "lounge2/tip/article";
			
		} catch (NullPointerException e) {
		} catch (Exception e) {
			log.info("article : ", e);
		}
		
		return "redirect:/lounge2/tip?" + query;
	}
	
	@GetMapping("tip/deleteFile")
	public String deleteFile(@RequestParam(name = "psnum") long num,
			@RequestParam(name = "page") String page,
			HttpSession session) throws Exception {
		
		try {
			SessionInfo info = (SessionInfo) session.getAttribute("member");
			FreeBoard dto = Objects.requireNonNull(service.findById(num));
			
			if (! info.getNickName().equals(dto.getNickname())) {
				return "redirect:/lounge2/tip?page=" + page;
			}
			
			if (dto.getSsfname() != null) {
				service.deleteUploadFile(uploadPath, dto.getSsfname());
				
				dto.setSsfname("");
				dto.setCpfname("");
				
				service.updateBoard(dto, uploadPath);
			}
			
			return "redirect:/lounge2/tip/update?num=" + num + "&page=" + page;
			
		} catch (NullPointerException e) {
		} catch (Exception e) {
			log.info("deleteFile : ", e);
		}
		
		return "redirect:/lounge2/tip/list?page=" + page;
	}
	
	@GetMapping("tip/delete")
	public String deleteBoard(@RequestParam(name = "psnum") long num,
			@RequestParam(name = "schType", defaultValue = "all") String schType,
			@RequestParam(name = "kwd", defaultValue = "") String kwd,
			@RequestParam(name = "page") String page,
			HttpSession session) {
		
		String query = "page=" + page;
		
		try {
			kwd = URLDecoder.decode(kwd, "utf-8");
			if (! kwd.isBlank()) {
				query += "&schType=" + schType + "&kwd=" + URLEncoder.encode(kwd, "utf-8");
			}
			
			SessionInfo info = (SessionInfo) session.getAttribute("member");
			
			service.deleteBoard(num, uploadPath, info.getNickName(), info.getGrade());
			
		} catch (Exception e) {
			log.info("deleteBoard : ", e);
		}
		
		return "redirect:/lounge2/tip?" + query;
	}
	
	@GetMapping("download")
	public ResponseEntity<?> download(
			@RequestParam(name = "psnum") long num,
			HttpServletRequest req) throws Exception {
		
		try {
			FreeBoard dto = Objects.requireNonNull(service.findById(num));
			
			return storageService.downloadFile(uploadPath, dto.getSsfname(), dto.getCpfname());
			
		} catch (NullPointerException e) {
		} catch (Exception e) {
			log.info("download : ", e);
		}
		
		String url = req.getContextPath() + "/lounge2/tip/downloadFailed";
		
		return ResponseEntity
				.status(HttpStatus.FOUND)
				.location(URI.create(url))
				.build();
	}
	
	@GetMapping("tip/downloadFailed")
	public String downloadFailed() {
		return "error/downloadFailure";
	}
	
	/*
	@GetMapping("update")
	public String updateForm(
			@RequestParam(name = "num") long num,
			@RequestParam(name = "page") String page,
			Model model,
			HttpSession session) throws Exception {
		try {
			SessionInfo info = (SessionInfo) session.getAttribute("member");
			
			FreeBoard dto = Objects.requireNonNull(service.findById(num));
			
			if (! info.getNickName().equals(dto.getNickname())) {
				return "redirect:/lounge2/tip?page=" + page;
			}
			
			model.addAttribute("dto", dto);
			model.addAttribute("page", page);
			model.addAttribute("mode", "update");
			
			return "lounge2/tip/write";
			
		} catch (NullPointerException e) {
		} catch (Exception e) {
			log.info("updateForm : ", e);
		}
		
		return "redirect:/lounge2/tip/list?page=" + page;
	}
	
	@PostMapping("update")
	public String updateSubmit(FreeBoard dto, @RequestParam(name = "page") String page) throws Exception {
		try {
			service.updateBoard(dto, uploadPath);
		} catch (Exception e) {
			log.info("updateSubmit : ", e);
		}
		return "redirect:/lounge2/tip?page=" + page;
	}
	
	// 게시글 좋아요 추가 / 삭제 : AJAX - JSON
	@ResponseBody
	@PostMapping("insertBoardLike")
	public Map<String, ?> insertBoardLike(
			@RequestParam(name = "num") long num,
			@RequestParam(name = "memberLiked") boolean memberLiked,
			HttpSession session) {
		Map<String, Object> model = new HashMap<>();
		
		String state = "true";
		int boardLikeCount = 0;
		
		try {
			SessionInfo info = (SessionInfo) session.getAttribute("member");
			
			Map<String, Object> map = new HashMap<>();
			map.put("num", num);
			map.put("nickname", info.getNickName());
			
			if (memberLiked) {
				service.deleteBoardLike(map); // 좋아요 해제
			} else {
				service.insertBoardLike(map); // 좋아요 추가
			}
			
			boardLikeCount = service.boardLikeCount(num);
			
		} catch (DuplicateKeyException e) {
			state ="liked";
		} catch (Exception e) {
			state = "false";
		}
		
		model.put("state", state);
		model.put("boardLikeCount", boardLikeCount);
		
		return model;
	}
	
	
	// 댓글 리스트 : AJAX - TEXT
	@GetMapping("listReply")
	public String listReply(
			@RequestParam(name = "num") long num,
			@RequestParam(name = "pageNo", defaultValue = "1") int current_page,
			Model model,
			HttpServletResponse resp,
			HttpSession session) throws Exception {
		
		try {
			SessionInfo info = (SessionInfo) session.getAttribute("member");
			
			int size = 5;
			int total_page = 0;
			int dataCount = 0;
			
			Map<String, Object> map = new HashMap<>();
			map.put("num", num);
			map.put("grade", info.getGrade());
			map.put("nickname", info.getNickName());
			
			dataCount = service.replyCount(map);
			total_page = paginateUtil.pageCount(dataCount, size);
			current_page = Math.min(current_page, total_page);
			
			int offset = (current_page - 1) * size;
			if (offset < 0) offset = 0;
			
			map.put("offset", offset);
			map.put("size", size);
			
			List<FreeReply> listReply = service.listReply(map);
			
			// 페이징 - 자바스크립트 함수 호출
			// listPage : 페이지를 클릭하면 호출할 자바스크립트 함수명
			String paging = paginateUtil.pagingMethod(current_page, total_page, "listPage");
			
			model.addAttribute("listReply", listReply);
			model.addAttribute("pageNo", current_page);
			model.addAttribute("replyCount", dataCount);
			model.addAttribute("total_page", total_page);
			model.addAttribute("paging", paging);
			
		} catch (Exception e) {
			log.info("listReply : ", e);
			
			resp.sendError(406);
			throw e;
		}
		
		return "bbs/listReply";
	}
	
	// 댓글의 좋아요 / 싫어요 추가 : AJAX - JSON
	@ResponseBody
	@PostMapping("insertReplyLike")
	public Map<String, ?> insertReplyLike(
			@RequestParam Map<String, Object> paramMap,
			HttpSession session) {
		
		Map<String , Object> model = new HashMap<>();
		
		String state = "true";
		int likeCount = 0;
		int disLikeCount = 0;
		
		try {
			SessionInfo info = (SessionInfo) session.getAttribute("member");
			
			paramMap.put("userId", info.getNickName());
			service.insertReplyLike(paramMap);
			
			// 좋아요 / 싫어요 개수
			Map<String, Object> countMap = service.replyLikeCount(paramMap);
			// 마이바티스의 resultType 이 map 인 경우 int 는 BigDecimal 로 넘어옴
			// 오라클에서 resultType 이 map 인 경우 컬럼명은 모두 대문자로 넘어옴
			likeCount = ((BigDecimal)countMap.get("LIKECOUNT")).intValue();
			disLikeCount = ((BigDecimal)countMap.get("DISLIKECOUNT")).intValue();
			
		} catch (DuplicateKeyException e) {
			state = "liked";
		} catch (Exception e) {
			state = "false";
		}
		
		model.put("likeCount", likeCount);
		model.put("disLikeCount", disLikeCount);
		model.put("state", state);
		
		return model;
	}
	*/
}
