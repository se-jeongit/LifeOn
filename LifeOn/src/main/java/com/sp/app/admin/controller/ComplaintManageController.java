package com.sp.app.admin.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sp.app.admin.model.Report;
import com.sp.app.admin.service.ReportService;
import com.sp.app.common.PaginateUtil;
import com.sp.app.lounge.model.FreeBoard;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequiredArgsConstructor
@Slf4j
@RequestMapping("/admin/complaintManage/*")
public class ComplaintManageController {
	private final PaginateUtil paginateUtil;
	private final ReportService service;
	
	@GetMapping("list")
	public String complaintManage(@RequestParam(name="page", defaultValue = "1") int current_page,
			Model model, HttpServletRequest req) throws Exception {
		try {
			int size = 10;
			int total_page = 0;
			int dataCount = 0;
			
			Map<String, Object> map = new HashMap<>();
			dataCount = service.dataCount(map);
			if(dataCount != 0) {
				total_page = paginateUtil.pageCount(dataCount, size);
			}
			
			current_page = Math.min(current_page, total_page);
			
			//리스트에 출력할 데이터 가져오기
			int offset = (current_page -1) * size;
			if(offset < 0) offset = 0;
			
			map.put("offset", offset);
			map.put("size", size);
			
			//리포트 리스트
			List<Report> list = service.listReport(map);
			String paging = paginateUtil.paging(current_page, total_page, "listReport");
			String repsucees = "";
			String repsucboolean = "";
			
			model.addAttribute("list", list);
			model.addAttribute("repsucees", repsucees);
			model.addAttribute("repsucboolean", repsucboolean);
			model.addAttribute("page", current_page);
			model.addAttribute("dataCount", dataCount);
			model.addAttribute("total_page", total_page);
			model.addAttribute("paging", paging);
			
		} catch (Exception e) {
			log.info("list", e);
		}	
		return "admin/complaintManage/list";
	}
	
	@GetMapping("reportDetail")
	@ResponseBody
	public Map<String, Object> getReportDetail(FreeBoard dto, @RequestParam(name="repan") Long repan,
			HttpSession session) {
		
		
		
		Map<String, Object> reportDetail = service.getReportDetail(repan);
		
		
		if(reportDetail == null) {
			reportDetail = new HashMap<>();
			reportDetail.put("title", "제목 없음");
			reportDetail.put("author", "익명");
			reportDetail.put("content", "내용 없음");
		}
		

		System.out.println("📌 최종 반환 데이터: " + reportDetail);
		return reportDetail;
	}
	
	
	
	
}
