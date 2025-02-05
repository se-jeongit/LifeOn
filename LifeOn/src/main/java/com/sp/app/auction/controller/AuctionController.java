package com.sp.app.auction.controller;


import com.sp.app.auction.request.CategoryRequest;
import com.sp.app.auction.response.BigCategoryResponse;
import com.sp.app.auction.response.SmallCategoryResponse;
import com.sp.app.auction.service.AuctionService;
import com.sp.app.auction.vo.CategoryBig;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/auction/*")
@RequiredArgsConstructor
public class AuctionController {

    private final AuctionService auctionService;

    @GetMapping()
    public ModelAndView moveMain(){

        ModelAndView mav = new ModelAndView("auction/auction_main");

        BigCategoryResponse bigCategory = auctionService.findByAllCategoryBig();


        mav.addObject("category", bigCategory);

        return mav;
    }


    //TODO: 카테고리 검색어 입력시 처리동작 페이지관련된 처리 미처리 상태
    @PostMapping(value = "/category", consumes = "application/x-www-form-urlencoded")
    public ResponseEntity<?> handleCategoryRequest(CategoryRequest categoryRequest) {
        if (categoryRequest.getCategoryType().equals("big")) {
            BigCategoryResponse categories = auctionService.findByAllCategoryBig();
            categories.setCategoryType("big");
            categories.setCbn(0);
            return ResponseEntity.ok(categories);
        } else if (categoryRequest.getCategoryType().equals("small")) {
            Map<String, Object> map = Map.of("cbn", categoryRequest.getCbn());
            SmallCategoryResponse categories = auctionService.findByAllCategorySmall(map);
            categories.setCategoryType("small");
            categories.setCbn(categoryRequest.getCbn());
            return ResponseEntity.ok(categories);
        }


        return ResponseEntity.badRequest().build();
    }

}
