package com.sp.app.chat;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import jakarta.servlet.http.HttpServletRequest;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequiredArgsConstructor
@Slf4j
@RequestMapping("/chat/*")
public class ChatController {
	@GetMapping("main")
	public String handle(HttpServletRequest req, Model model) {
		
		String cp = req.getContextPath();
		String url = "ws://" + req.getServerName() + ":" +
				req.getServerPort() + cp + "/chat.msg";
		
		model.addAttribute("wsURL", url);
	
		return "chat/main";
		
	}
}
