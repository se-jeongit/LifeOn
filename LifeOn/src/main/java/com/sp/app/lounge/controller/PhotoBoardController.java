package com.sp.app.lounge.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sp.app.lounge.model.PhotoBoard;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequiredArgsConstructor
@Slf4j
@RequestMapping(value = "/lounge1/*")
public class PhotoBoardController {
	// private final PhotoBoardService service;
	
	@GetMapping("room")
	public String roomList() {
		return "lounge1/room/list";
	}
	
	@GetMapping("recipe")
	public String recipeList() {
		return "lounge1/recipe/list";
	}
	
	@GetMapping("write")
	public String writeForm(Model model) throws Exception {
		model.addAttribute("mode", "write");
		return "lounge1/room/write";
	}
}
	/*
	@GetMapping("room/write")
	public String writeSubmit(PhotoBoard dto,
			HttpSession session) throws Exception {
		
		try {
			
		} catch (Exception e) {
			log.info("writeSubmit : ", e);
		}
		
		return "redirect:/lounge1/room/list";
	}
}
*/