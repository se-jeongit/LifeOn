package com.sp.app.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequiredArgsConstructor
@Slf4j
@RequestMapping("/admin/productManage/*")
public class ProductManageController {

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
	public String stockRegister() throws Exception {

		return "admin/productManage/stockRegister";
	}
}
