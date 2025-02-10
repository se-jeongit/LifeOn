package com.sp.app.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sp.app.service.LoungeService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequiredArgsConstructor
@Slf4j
@RequestMapping("/lounge/*")
public class LoungeController {
	private final LoungeService service;
	
	@GetMapping("write")
	public String writeForm(@RequestParam String category, Model model) throws Exception {
        model.addAttribute("mode", "write");
        model.addAttribute("category", category);
        return "lounge/room/write";
	}
}
