package com.sp.app.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.sp.app.model.Member;
import com.sp.app.model.SessionInfo;
import com.sp.app.service.MemberService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequiredArgsConstructor
@Slf4j
@RequestMapping(value = "/member/*")
public class MemberController {
	private final MemberService service;
	/* -로그인창은 모달로 처리
	@GetMapping("login")
	public String login() {
		return "member/login";
				
	}
	*/
	
	@PostMapping("login")
	public String loginSubmit(@RequestParam(name = "id") String id,
			@RequestParam(name = "pwd") String pwd,
			Model model, HttpSession session) {
		
		Member dto = service.loginMember(id);
		if(dto == null || !pwd.equals(dto.getPwd())) {
			model.addAttribute("message", "아이디 또는 비밀번호가 일치하지 않습니다.");
			return "redirect:/"; //모달로 처리하니까 생각 다시해봐
		}
		
		/* 빌더로 정보 저장 하는 경우
		SessionInfo info = SessionInfo.builder()
				.id(dto.getId())
				.nickName(dto.getNickName())
				.grade(dto.getGrade())
				.build();
		*/	
		
		SessionInfo info = new SessionInfo();
		info.setId(dto.getId());
		info.setNickName(dto.getNickName());
		info.setGrade(dto.getGrade());
		
		session.setMaxInactiveInterval(60 * 60); // 세션 유지시간 60분
		
		session.setAttribute("member", info);
		
		// 로그인 이전 주소로 이동
		String uri = (String) session.getAttribute("preLoginURI");
		session.removeAttribute("preLoginURI");
		if (uri == null) {
			uri = "redirect:/";
		} else {
			uri = "redirect:" + uri;
		}

		return uri;	
	}
	
	//로그아웃
	@GetMapping("logout")
	public String logout(HttpSession session) {
		
		session.removeAttribute("member");
		session.invalidate();
		return "redirect:/";
	}
	
	//회원가입
	@GetMapping("join")
	public String memberForm(Model model) {
		model.addAttribute("mode", "account");
		
		return "member/member";
	}
	
	@PostMapping("join")
	public String memberSubmit(Member dto,
			final RedirectAttributes reAttr,
			Model model,
			HttpServletRequest req) {
		try {
			service.insertMember(dto);
			
			StringBuilder sb = new StringBuilder();
			sb.append(dto.getName() + "님의 회원 가입이 정상적으로 처리되었습니다.<br>");
			sb.append("메인화면으로 이동하여 로그인 하시기 바랍니다.<br>");			
			
			reAttr.addFlashAttribute("message", sb.toString());
			reAttr.addFlashAttribute("title", "회원 가입");

			return "redirect:/member/complete";			
			
		} catch (Exception e) {
			model.addAttribute("mode", "account");
			model.addAttribute("message", "회원가입이 실패했습니다.");
		}
		
		
		
		return "member/member";
	}
	
	@GetMapping("complete")
	public String complete(@ModelAttribute("message") String message) throws Exception {

		// 컴플릿 페이지(complete.jsp)의 출력되는 message와 title는 RedirectAttributes 값이다.
		// F5를 눌러 새로 고침을 하면 null이 된다.

		if (message == null || message.length() == 0) { // F5를 누른 경우
			return "redirect:/";
		}

		return "member/complete";
	}	
	
	
	//아이디찾기
	@GetMapping("idFind")
	public String idFind() {
		return "member/idFind";
	}
	
	//비밀번호찾기
	@GetMapping("pwdFind")
	public String pwdFind() {
		return "member/pwdFind";
	}
	
	
	
}
