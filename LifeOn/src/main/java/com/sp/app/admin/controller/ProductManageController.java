package com.sp.app.admin.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sp.app.admin.model.ProductManage;
import com.sp.app.admin.service.ProductManageService;
import com.sp.app.common.StorageService;

import jakarta.annotation.PostConstruct;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequiredArgsConstructor
@Slf4j
@RequestMapping("/admin/productManage/*")
public class ProductManageController {
	private final ProductManageService service;
	private final StorageService storageService;
	
	private String uploadPath;
	@PostConstruct
	public void init() {
		uploadPath = this.storageService.getRealPath("/uploads/product");
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
	
	@GetMapping("list")
	public String productManage() throws Exception {

		return "admin/productManage/list";
	}
	
	@GetMapping("stock")
	public String stockManage() throws Exception {

		return "admin/productManage/stock";
	}
	
	@GetMapping("register")
	public String register() throws Exception {

		return "admin/productManage/register";
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
	
	
	
	@ResponseBody
	@PostMapping("smallCategories")
	public List<ProductManage> getSmallCategories(@RequestParam(name = "cbn") int cbn) {
	    return service.listSmallCategory(cbn);
	}
	
}
