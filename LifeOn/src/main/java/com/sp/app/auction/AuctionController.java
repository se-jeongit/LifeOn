package com.sp.app.auction;


import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RestController
@RequestMapping("/auction/*")
public class AuctionController {

    @GetMapping()
    public ModelAndView moveMain(){


        return new ModelAndView("auction/auction_main");
    }



}
