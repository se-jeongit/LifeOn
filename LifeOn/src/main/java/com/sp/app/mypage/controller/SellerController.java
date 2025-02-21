package com.sp.app.mypage.controller;

import com.sp.app.auction.vo.CategoryBig;
import com.sp.app.auction.vo.CategorySmall;
import com.sp.app.mypage.controller.dto.response.CategoryResponse;
import com.sp.app.mypage.service.SellerService;
import com.sp.app.mypage.service.SellerServiceInterFace;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@RestController
@RequestMapping("/mypage/seller")
@RequiredArgsConstructor
public class SellerController {

    private final SellerServiceInterFace sellerService;

    @GetMapping("/info")
    public ModelAndView main() {
        return new ModelAndView("mypage/seller/seller_main");
    }

    @GetMapping("/registration")
    public ModelAndView registrationPage(){
        ModelAndView mav = new ModelAndView("mypage/seller/auction/auction_registration");

        CategoryResponse respList = sellerService.findByAllCategory();

        mav.addObject("category", respList);

        return mav;
    }


}
