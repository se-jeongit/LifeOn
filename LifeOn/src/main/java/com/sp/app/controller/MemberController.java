package com.sp.app.controller;

import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.Map;
import java.util.Objects;
import java.util.Random;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.sp.app.model.Member;
import com.sp.app.model.SessionInfo;
import com.sp.app.service.CoolSmsService;
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
	private final CoolSmsService coolSmsService;
	
	
	/* 초기 로그인은 모달로 처리할거다.
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
			return "member/login"; //모달로 처리하니까 생각 다시해봐
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
		info.setNum(dto.getNum());
		
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
		model.addAttribute("mode", "join");
		
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
			model.addAttribute("mode", "join");
			model.addAttribute("message", "회원가입이 실패했습니다.");
		}
		
		
		
		return "member/member";
	}
	
	//성공했을경우
	@GetMapping("complete")
	public String complete(@ModelAttribute("message") String message) throws Exception {

		// 컴플릿 페이지(complete.jsp)의 출력되는 message와 title는 RedirectAttributes 값이다.
		// F5를 눌러 새로 고침을 하면 null이 된다.

		if (message == null || message.length() == 0) { // F5를 누른 경우
			return "redirect:/";
		}

		return "member/complete";
	}	
	
	@GetMapping("pwd")
	public String pwdForm(@RequestParam(name="mode", required = false) String mode,
			Model model) {
		if(mode == null) {
			model.addAttribute("mode", "update"); //정보수정
		} else {
			model.addAttribute("mode", "retire"); //회원탈퇴
		}
		
		return "member/pwd";
	}
	
	@PostMapping("pwd")
	public String pwdSubmit(@RequestParam(name = "pwd") String pwd,
			@RequestParam(name = "mode") String mode,
			final RedirectAttributes reAttr,
			Model model,
			HttpSession session) {
		
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		try {
			Member dto = Objects.requireNonNull(service.findById(info.getId()));
			
			if(! dto.getPwd().equals(pwd)) { // 패스워드 일치하지 않을경우 !! 횟수제한처리할거면 여기서
				model.addAttribute(mode, "mode");
				model.addAttribute("message", "패스워드가 일치하지 않습니다.");
				return "member/pwd";
			}
			
			if(mode.equals("retire")) { //회원탈퇴 처리
				
				//그 회원관련 게시판 등 자료 삭제 처리 보류
				
				Map<String, Object> map = new HashMap<>();
				map.put("num", info.getNum());
				service.deleteMember(map);
				session.removeAttribute("member");
				session.invalidate();
				
				StringBuilder sb = new StringBuilder();
				sb.append(dto.getId() + "님의 회원 탈퇴 처리가 정상적으로 처리되었습니다.<br>");
				sb.append("메인화면으로 이동 하시기 바랍니다.<br>");

				reAttr.addFlashAttribute("title", "회원 탈퇴");
				reAttr.addFlashAttribute("message", sb.toString());

				return "redirect:/member/complete";					
			}
			
			//회원정보수정
			model.addAttribute("dto", dto);
			model.addAttribute("mode", "update");
			
			System.out.println("Updating member with num: " + dto.getNum());

			return "member/member";			
		
		} catch (NullPointerException e) {
			session.invalidate();
		} catch (Exception e) {
		}
		
		return "redirect:/";
	}
	
	//회원정보수정
	@PostMapping("update")
	public String updateSubmit(Member dto,
			final RedirectAttributes reAttr,
			Model model) {
		StringBuilder sb = new StringBuilder();
		try {
			
			System.out.println("Updating member with num: " + dto.getNum());
			service.updateMember(dto);
			
			sb.append(dto.getId() + "님의 회원정보가 정상적으로 변경되었습니다.<br>");
			sb.append("메인화면으로 이동 하시기 바랍니다.<br>");
			
		} catch (Exception e) {
			sb.append(dto.getName() + "님의 회원정보 변경이 실패했습니다.<br>");
			sb.append("잠시후 다시 변경 하시기 바랍니다.<br>");			
		}
		
		reAttr.addFlashAttribute("title", "회원 정보 수정");
		reAttr.addFlashAttribute("message", sb.toString());
		return "redirect:/member/complete";
	}
	
	
	//아이디 중복검사
	@ResponseBody
	@PostMapping("idCheck")
	public Map<String, ?> idCheck(@RequestParam(name="id") String id) throws Exception {
		Map<String, Object> model = new HashMap<>();
		
		String p = "false";
		try {
			Member dto = service.findById(id);
			if(dto == null) {
				p = "true";
			}
		} catch (Exception e) {
		}
		
		model.put("passed", p);
		
		return model;
	}
	
	//닉네임 중복검사
	@ResponseBody
	@PostMapping("nickNameCheck")
	public Map<String, ?> nickNameCheck(@RequestParam(name="nickName") String nickName) throws Exception{
		Map<String, Object> model = new HashMap<>();
		
		String p = "false";
		try {
			Member dto = service.findByNickName(nickName);
			if(dto == null) {
				p = "true";
			}
		} catch (Exception e) {
		}
		
		model.put("passed", p);
		
		return model;
	}
	
	
	//아이디찾기
	@GetMapping("idFind")
	public String idFindForm() {
		return "member/idFind";
	}
	
	@ResponseBody
	@PostMapping("idFind")
	public Map<String, ?> idFindSubmit(@RequestParam(name= "tel") String tel) throws Exception {
		Map<String, Object> model = new HashMap<>();
		String p = "true";
		try {
			String tel1 = tel.substring(0, 3);
	        String tel2 = tel.substring(3, 7);
	        String tel3 = tel.substring(7);
			Member dto = service.findByTel(tel1, tel2, tel3);
			if(dto == null) {
				p = "false";
			}
		} catch (Exception e) {
		}
		
		model.put("telchecked", p);
		
		return model;
	}
	
	//인증번호 전송 api
	@ResponseBody
	@PostMapping("sendAuthCode")
	public Map<String, Object> sendAuthCode(@RequestParam(value ="tel") String tel, HttpSession session){
		Map<String, Object> model = new HashMap<>();
		
		Random random = new Random();
		String authCode  = String.format("%06d", random.nextInt(1000000));
		
		try {
			session.setAttribute("tel", tel);

			
			String message = "[LifeOn]인증번호 : " + authCode  + "(5분 내 입력)";
			coolSmsService.sendSms(tel, message);
			
			session.setAttribute("authCode", authCode );
			session.setAttribute("authExpireTime", LocalDateTime.now().plusMinutes(5));
			
			model.put("success", true);
			model.put("message", "인증번호가 전송되었습니다");
			
		} catch (Exception e) {
			model.put("success", false);
			model.put("message", "인증번호 전송에 실패했습니다.");
		}
		
		return model;
	}
	
	@ResponseBody
	@PostMapping("verifyAuthCode")
	public String verifyAuthCode(@RequestParam(value = "authCode") String authCode, HttpSession session, RedirectAttributes redirectAttributes) {
	    String storedAuthCode = (String) session.getAttribute("authCode");
	    LocalDateTime expireTime = (LocalDateTime) session.getAttribute("authExpireTime");

	    // 세션에서 전화번호 가져오기 (번호 확인 시 저장)
	    String tel1 = (String) session.getAttribute("tel1");
	    String tel2 = (String) session.getAttribute("tel2");
	    String tel3 = (String) session.getAttribute("tel3");

	    if (storedAuthCode == null || expireTime == null || LocalDateTime.now().isAfter(expireTime)) {
	        redirectAttributes.addFlashAttribute("errorMessage", "인증번호가 만료되었습니다.");
	        return "redirect:/member/idFind"; // 인증 실패 시 다시 입력 페이지로 이동
	    } else if (!storedAuthCode.equals(authCode)) {
	        redirectAttributes.addFlashAttribute("errorMessage", "인증번호가 올바르지 않습니다.");
	        return "redirect:/member/idFind"; // 인증 실패 시 다시 입력 페이지로 이동
	    } else {
	        session.removeAttribute("authCode"); // 인증 후 세션에서 인증번호 삭제
	        session.removeAttribute("authExpireTime");

	        // ✅ 기존 findByTel() 메서드를 활용하여 ID 조회
	        Member user = service.findByTel(tel1, tel2, tel3);

	        if (user == null) {
	            redirectAttributes.addFlashAttribute("errorMessage", "등록된 계정을 찾을 수 없습니다.");
	            return "redirect:/member/idFind";
	        }

	        // ✅ 사용자 ID를 `redirectAttributes`에 저장하여 `idFindComplete.jsp`에서 사용
	        redirectAttributes.addFlashAttribute("id", user.getId());
	        return "redirect:/member/idFindComplete"; // 인증 성공 후 ID 표시 페이지로 이동
	    }
	}
	
	
	
	
	
	//비밀번호찾기
	@GetMapping("pwdFind")
	public String pwdFind() {
		return "member/pwdFind";
	}
	
	//아이디찾기성공
	@GetMapping("idFindComplete")
	public String idFindComplete() {
		return "member/idFindComplete";
	}
	
	//비밀번호재설정
	@GetMapping("pwdSet")
	public String pwdSet() {
		return "member/pwdSet";
	}
	
	
}
