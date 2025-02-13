package com.sp.app.lounge.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequiredArgsConstructor
@Slf4j
@RequestMapping("/lounge1/*")
public class PhotoBoardController {
	// private final PhotoBoardService service;
	
	/*
	@GetMapping("/{bdtype}")
	public String boardList(@PathVariable String bdtype, Model model) {
	    model.addAttribute("bdtype", bdtype);  
	    return "lounge1/" + bdtype + "/list";  
	}
	*/
	
	@GetMapping("room")
	public String roomList(Model model) {
		
		model.addAttribute("bdtype", "room");
		
		return "lounge1/list";
	}
	
	@GetMapping("recipe")
	public String recipeList(Model model) {
		
		model.addAttribute("bdtype", "recipe");
		
		return "lounge1/list";
	}
	
	@GetMapping("write/{bdtype}")
	public String writeForm(@PathVariable(name = "bdtype") String bdtype, Model model) throws Exception {
		
		model.addAttribute("bdtype", bdtype);
		model.addAttribute("mode", "write");
		
		return "lounge1/write";
	}
	
	
	/*
	@GetMapping("room/write")
	public String writeForm(Model model) throws Exception {
		model.addAttribute("mode", "write");
		return "lounge1/room/write";
	}
	
	@GetMapping("room/write")
	public String writeSubmit(PhotoBoard dto,
			HttpSession session) throws Exception {
		
		try {
			
		} catch (Exception e) {
			log.info("writeSubmit : ", e);
		}
		
		return "redirect:/lounge1/room/list";
	}
	*/
}
