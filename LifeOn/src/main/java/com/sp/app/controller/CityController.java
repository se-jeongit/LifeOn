package com.sp.app.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/city/*")
public class CityController {
	
	@GetMapping("write")
	public String writeForm() {
		return "city/write";
	}
}