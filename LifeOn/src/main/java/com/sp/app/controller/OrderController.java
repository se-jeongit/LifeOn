package com.sp.app.controller;

import java.util.Objects;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.sp.app.admin.model.ProductManage;
import com.sp.app.admin.service.ProductManageService;
import com.sp.app.model.Member;
import com.sp.app.model.Order;
import com.sp.app.model.SessionInfo;
import com.sp.app.service.MemberService;
import com.sp.app.service.OrderService;
import com.sp.app.service.PointRecordService;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequiredArgsConstructor
@Slf4j
@RequestMapping(value = "/market/order/*")
public class OrderController {
	private final MemberService memberService;
	private final ProductManageService productService;
	private final OrderService orderService;
	private final PointRecordService pService;
	
	
	@GetMapping("payment")
	public String paymentForm(@RequestParam(name = "pnum") long pnum,
			HttpSession session,
			Model model) {
		
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		
		try {
			Member dto1 = Objects.requireNonNull(memberService.findById(info.getId()));
			
			ProductManage dto2 = Objects.requireNonNull(productService.findByPnum(pnum));
			
			model.addAttribute("dto1", dto1);
			model.addAttribute("dto2", dto2);
			
		} catch (Exception e) {
			log.info("paymentForm : ", e);
		}
		
		return "market/order/payment";
	}
	
	
	@PostMapping("payment")
	public String paymentSubmit(Order dto,
			final RedirectAttributes reAttr,
			Model model,
			HttpSession session) {
		
		try {
			//주문들어와서 보유포인트보다 많게 주문할시 새로운창으로
			SessionInfo info = (SessionInfo) session.getAttribute("member");
			int totalPoint = 0;
			totalPoint = pService.totalPoint(info.getNum());
			
			StringBuilder sb = new StringBuilder();
			if(dto.getOp()>totalPoint) {
				sb.append("포인트가 부족합니다.<br>");
				sb.append("결제를 실패했습니다.");
				reAttr.addFlashAttribute("message", sb.toString());
				reAttr.addFlashAttribute("title", "주문실패");
				return "redirect:/member/complete";
			}
			
			orderService.insertOrder(dto);
			
			sb.append("주문이 성공적으로 이루어졌습니다.<br>");
			sb.append("축하합니다.<br>");
			
			reAttr.addFlashAttribute("message", sb.toString());
			reAttr.addFlashAttribute("title", "주문성공");

			return "redirect:/member/complete";	
			
			
		} catch (Exception e) {
			log.info("payment : ", e);
		}
		
		
		return "market/order/payment";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
