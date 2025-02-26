package com.sp.app.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Objects;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sp.app.admin.model.ProductManage;
import com.sp.app.admin.service.ProductManageService;
import com.sp.app.common.PaginateUtil;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequiredArgsConstructor
@Slf4j
@RequestMapping(value = "/market/together/*")
public class TogetherController {
	private final ProductManageService service;
	private final PaginateUtil paginateUtil;
	
	@ResponseBody
	@PostMapping("smallCategories")
	public List<ProductManage> getSmallCategories(@RequestParam(name = "cbn") int cbn) {
			
		return service.listSmallCategory(cbn);
	}
	
	@GetMapping("main")
	public String listShow (@RequestParam(name = "page", defaultValue = "1") int current_page,
			@RequestParam(name = "csn", defaultValue = "0") int csn,
			Model model, HttpServletRequest req) throws Exception {
			System.out.println("Received csn: " + csn);  // csn 값 확인
		try {
			int size = 9;
			int total_page = 0;
			int dataCount = 0;
			Map<String, Object> map = new HashMap<>();
			map.put("csn", csn);
			
			dataCount = service.dataCount3(map);
			total_page = paginateUtil.pageCount(dataCount, size);
			current_page = Math.min(current_page, total_page);
			
			int offset = (current_page -1) * size;
			if(offset < 0 ) offset = 0;
			
			map.put("offset", offset);
			map.put("size", size);
			
			String cp = req.getContextPath();
			String listUrl = cp + "/market/together/main";
			String query = "page=" + current_page;
			String articleUrl  = cp + "/market/together/detail";
			
			List<ProductManage> list = service.listTogetherProduct(map);
			String paging = paginateUtil.paging(current_page, total_page, listUrl);
			
			for(ProductManage dto : list) {
				if(dto.getStatus().equals("진행중")) {
					dto.setStatus("구매가능");
				} else if(dto.getStatus().equals("진행전")) {
					dto.setStatus("진행전");
				} else {
					dto.setStatus("마감");
				}
			}
			
			
			model.addAttribute("list", list);
			model.addAttribute("dataCount", dataCount);
			model.addAttribute("size", size);
			model.addAttribute("page", current_page);
			model.addAttribute("total_page", total_page);
			model.addAttribute("paging", paging);
			model.addAttribute("query", query);
			model.addAttribute("articleUrl", articleUrl);
			model.addAttribute("csn", csn);
			//카테고리 가져오기
			List<ProductManage> bigCategory = service.listBigCategory();
			model.addAttribute("bigCategory", bigCategory);

		} catch (Exception e) {
			log.info("listShow : ", e);
		}
		
		
		
		
		return "market/together/main";
	}
	
	
	

	@GetMapping("detail")
	public String detail(@RequestParam(name = "pnum") long pnum,
			@RequestParam(name = "page", defaultValue = "1") String page,
			Model model,
			HttpSession session) throws Exception {
		
		String query = "page=" + page;
		
		try {
			
			ProductManage dto = Objects.requireNonNull(service.findByPnum(pnum));
			
			if(dto.getStatus().equals("진행중")) {
				dto.setStatus("구매가능");
			} else if(dto.getStatus().equals("진행전")) {
				dto.setStatus("진행전");
			} else {
				dto.setStatus("마감");
			}
			
			model.addAttribute("dto", dto);
			model.addAttribute("page", page);
			model.addAttribute("query", query);
			
			return "market/together/detail";
		} catch (NullPointerException e) {
		} catch (Exception e) {
			log.info("detail : ", e);
		}
		
		
		
		return "market/together/main?" + query;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
