package com.sp.app.mypage.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RestController
@RequestMapping("/mypage/seller")
public class SellerController {

    @GetMapping("/info")
    public ModelAndView main() {
        return new ModelAndView("mypage/seller/seller_main");
    }

    @GetMapping("/registration")
    public ModelAndView registrationPage(){
        return new ModelAndView("mypage/seller/auction/auction_registration");
    }


}
