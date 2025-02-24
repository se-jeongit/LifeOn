package com.sp.app.admin.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sp.app.model.Member;
import com.sp.app.service.MemberManageService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequiredArgsConstructor
@Slf4j
@RequestMapping("/admin/memberManage/*")
public class MemberManageController {
	private final MemberManageService memberManageService;
	
	@GetMapping("main")
	public String memberManage(Model model) throws Exception{
		// 파라미터 Map 생성
		Map<String, Object> params = new HashMap<>();
		
		//회원 목록 조회
		List<Member> memberList = memberManageService.listMembers(params);
		
		// 회원 전채 개수 조회
		int dataCount = memberManageService.dataCount(params);
		
		// 조회 결과를 view에 전달
		model.addAttribute("memberList", memberList);
		model.addAttribute("dataCount", dataCount);
		
		// 해당 view 경로 반환
		return "admin/memberManage/main";
		
	}
	
	@PostMapping("/updateMemberAuthority")
	public String updateMemberAuthority(@RequestParam Map<String, Object> map) {
		try {
			int result = memberManageService.updateMemberAuthority(map);
			
		} catch (Exception e) {
			log.error("회원 활성화 상태 업데이트 오류 : ", e);
		}
		return "redirect:/admin/memberManage/main";
	}
}
