package com.sp.app.controller;

import com.sp.app.common.PaginateUtil;
import com.sp.app.service.home.HomeService;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;
import java.util.Map;

@RestController
@RequiredArgsConstructor
@Slf4j
public class HomeController {

	private final PaginateUtil paginateUtil;
	private final HomeService homeService;
	
	@GetMapping("/")
	public ModelAndView handleHome(Model model) {
		ModelAndView mav = new ModelAndView("main/home");
		int size = 12;
		Map<String, Object> paginationMap = calculatePagination(new HashMap<>(), size, "auction");




		return mav;
	}



	private Map<String, Object> calculatePagination(Map<String, Object> map, int size, String url) {
		Map<String, Object> paginationMap = new HashMap<>();
		int total_page = 0;


		paginationMap.put("size", size);
		paginationMap.put("total_page", total_page);

		return paginationMap;
	}


}
