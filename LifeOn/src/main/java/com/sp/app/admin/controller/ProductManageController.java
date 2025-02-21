package com.sp.app.admin.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import com.sp.app.common.StorageService;

import jakarta.annotation.PostConstruct;
import jakarta.servlet.http.HttpServletRequest;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequiredArgsConstructor
@Slf4j
@RequestMapping("/admin/productManage/*")
public class ProductManageController {
	private final ProductManageService service;
	private final StorageService storageService;
	private final PaginateUtil paginateUtil;
	
	private String uploadPath;
	@PostConstruct
	public void init() {
		uploadPath = this.storageService.getRealPath("/uploads/product");
	}
	
	
	@GetMapping("stockRegister")
	public String stockRegister(Model model) throws Exception {
		
		try {
			List<ProductManage> bigCategory = service.listBigCategory();
			model.addAttribute("bigCategory", bigCategory);
			
		} catch (Exception e) {
			log.info("stockRegister : ", e);
		}
		
		
		return "admin/productManage/stockRegister";
	}
	
	@PostMapping("stockRegister")
	public String stockRegisterSubmit(ProductManage dto) throws Exception{
		try {
			service.insertProduct(dto, uploadPath);
		} catch (Exception e) {
			log.info("stockRegisterSubmit : ", e);
		}
		return "redirect:/admin/productManage/stock";
	}
	
	
	@ResponseBody
	@PostMapping("smallCategories")
	public List<ProductManage> getSmallCategories(@RequestParam(name = "cbn") int cbn) {
		return service.listSmallCategory(cbn);
	}
	
	@GetMapping("stock")
	public String stockManage(@RequestParam(name = "page", defaultValue = "1") int current_page,
			Model model, HttpServletRequest req) throws Exception {
		
		try {
			int size = 10;
			int total_page = 0;
			int dataCount = 0;
			Map<String, Object> map = new HashMap<>();
			
			dataCount = service.dataCount(map);
			total_page = paginateUtil.pageCount(dataCount, size);
			current_page = Math.min(current_page, total_page);
			
			int offset = (current_page -1) * size;
			if(offset < 0 ) offset = 0;
			
			map.put("offset", offset);
			map.put("size", size);
			
			String cp = req.getContextPath();
			String listUrl = cp + "/admin/productManage/stock";
			String query = "page=" + current_page;
			
			List<ProductManage> list = service.listProduct(map);
			String paging = paginateUtil.paging(current_page, total_page, listUrl);
			
			model.addAttribute("list", list);
			model.addAttribute("dataCount", dataCount);
			model.addAttribute("size", size);
			model.addAttribute("page", current_page);
			model.addAttribute("total_page", total_page);
			model.addAttribute("paging", paging);
			model.addAttribute("query", query);
			
		} catch (Exception e) {
			log.info("stock : ", e);
		}
		
		
		return "admin/productManage/stock";
	}
	
	@GetMapping("list")
	public String productManage(@RequestParam(name = "page", defaultValue = "1") int current_page,
			@RequestParam(name = "schType", defaultValue = "all") String schType,
			Model model, HttpServletRequest req) throws Exception {
		System.out.println("schType: " + schType);
		try {
			int size = 10;
			int total_page = 0;
			int dataCount = 0;
			Map<String, Object> map = new HashMap<>();
			map.put("schType", schType);
			
			System.out.println("schType: " + schType);
			
			dataCount = service.dataCount2(map);
			total_page = paginateUtil.pageCount(dataCount, size);
			current_page = Math.min(current_page, total_page);
			
			int offset = (current_page -1) * size;
			if(offset < 0 ) offset = 0;
			
			map.put("offset", offset);
			map.put("size", size);
			
			String cp = req.getContextPath();
			String listUrl = cp + "/admin/productManage/list";
			String query = "page=" + current_page;
			
			if(schType.length() != 0) {
				String qs = "schType=" + schType;
				listUrl += "?" +qs;
				query += "&" + qs;
			}
			
			
			List<ProductManage> list = service.listTogetherProduct(map);
			String paging = paginateUtil.paging(current_page, total_page, listUrl);
			
			model.addAttribute("list", list);
			model.addAttribute("dataCount", dataCount);
			model.addAttribute("size", size);
			model.addAttribute("page", current_page);
			model.addAttribute("total_page", total_page);
			model.addAttribute("paging", paging);
			
			model.addAttribute("schType", schType);
			model.addAttribute("query", query);
		} catch (Exception e) {
			log.info("list : ", e);
		}
		
		return "admin/productManage/list";
	}
	
	@GetMapping("register")
	public String register(@RequestParam(name = "pnum") long pnum,
			@RequestParam(name = "ptsq") int ptsq,
			Model model) throws Exception {
		model.addAttribute("pnum", pnum);
		model.addAttribute("ptsq", ptsq);
		return "admin/productManage/register";
	}
	
	@PostMapping("register")
	public String registerSubmit(ProductManage dto) {
		try {
			service.insertTogetherProduct(dto);
		} catch (Exception e) {
			log.info("registerSubmit : ", e);
		}
		return "redirect:/admin/productManage/list";
	}
	
	
	
	
	
}
